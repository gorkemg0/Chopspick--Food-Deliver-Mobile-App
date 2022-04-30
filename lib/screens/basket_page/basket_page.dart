import 'package:chopspick/global/component/loading_widget.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/basket_page/component/checkout_button.dart';
import 'package:chopspick/screens/basket_page/component/listview_builder_items.dart';
import 'package:chopspick/screens/landing_page/nav_bar_widget.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  BasketViewModel basketViewModel = Get.find();
  OrderViewModel orderViewModel = Get.find();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Container(
                  height: Get.height - 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() =>
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    '${basketViewModel.totalItemsLength.value
                                        .toString()} items in Cart',
                                    style: TextStyles.myPoppinsTextStyle(
                                      color: CustomColors.titleColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    child: SizedBox(
                                      height: Get.height * 0.4,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemCount: basketViewModel
                                            .products.value.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListViewBuilderItems(basketViewModel, index);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Instructions',
                                  style: TextStyles.myPoppinsTextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  child: TextField(
                                    controller: textEditingController,
                                    maxLines: 2,
                                    showCursor: false,
                                    style: TextStyles.myPoppinsTextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total:',
                                        style: TextStyles.myPoppinsTextStyle(
                                          color: CustomColors.titleColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Obx(() =>
                                          Text(
                                            r'$' +
                                                '${basketViewModel.totalPrice
                                                    .value}',
                                            style:
                                            TextStyles.myPoppinsTextStyle(
                                                color: Color(0xffB4AC03),
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.w600),
                                          )),
                                    ],
                                  ),
                                  CheckOutButton(textEditingController),
                                  backToHome(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() =>
              orderViewModel.state != ViewStateOrder.idle
                  ? LoadingWidget()
                  : Container()),
            ],
          ),
        ),
      ),
    );
  }
  GestureDetector backToHome() {
    return GestureDetector(
      onTap: () => BottomNavBarWidget().goToScreen(0),
      child: Text(
        'Back to Home',
        style: TextStyles.myPoppinsTextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}