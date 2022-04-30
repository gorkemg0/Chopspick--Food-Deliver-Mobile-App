import 'package:chopspick/global/component/loading_widget.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/home_page/component/app_bar_notification_icon.dart';
import 'package:chopspick/screens/home_page/component/category_list_view.dart';
import 'package:chopspick/screens/home_page/component/home_page_search.dart';
import 'package:chopspick/screens/home_page/component/item_gridview_builder.dart';
import 'package:chopspick/screens/home_page/component/promotion_widget.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OrderViewModel orderViewModel = Get.find();
  UserViewModel userViewModel = Get.find();
  BasketViewModel basketViewModel = Get.find();

  Future<bool> future() async {
    await orderViewModel.getProductsItem();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: appBarTitle(),
        actions: [
          AppBarNotificationIcon(),
        ],
      ),
      body: FutureBuilder(
        future: future(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget(),
                    SizedBox(height: 10),
                    HomePageSearch(),
                    CategoryListView(),
                    PromotionWidget(),
                    ProductItemBuilder(orderViewModel, basketViewModel),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: LoadingWidget());
          }
        },
      ),
    );
  }

  Text titleWidget() {
    return Text(
      'What do you want to order today?',
      style: TextStyles.myPoppinsTextStyle(
        color: Colors.black,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  CircleAvatar profilePicture() {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black,
    );
  }

  Row appBarTitle() {
    return Row(
      children: [
        Container(
          child: profilePicture(),
          padding: EdgeInsets.only(right: 6, left: 8),
        ),
        Text(
          'HI, ${userViewModel.user!.userName}',
          style: TextStyles.myPoppinsTextStyle(
              color: CustomColors.titleColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
