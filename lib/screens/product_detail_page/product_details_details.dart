import 'package:chopspick/global/component/image_path.dart';
import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/custom_decoration.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/product_detail_page/component/add_to_card_button.dart';
import 'package:chopspick/screens/product_detail_page/component/adds_ons_widget.dart';
import 'package:chopspick/screens/product_detail_page/component/asset_image_widget.dart';
import 'package:chopspick/screens/product_detail_page/component/cached_image_widget.dart';
import 'package:chopspick/screens/product_detail_page/component/product_rate_widget.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductModel productModel;
  bool? isAlreadyHave;
  ProductDetailsPage({required this.productModel, this.isAlreadyHave});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  OrderViewModel orderViewModel = Get.find();
  BasketViewModel basketViewModel = Get.find();
  RxInt amount = 1.obs;
  double halfOfTheScreen = Get.height * .5;

  @override
  void initState() {
    super.initState();
    basketViewModel.products.forEach((element) {
      if (element.productID == widget.productModel.productID) {
        amount.value = element.productAmount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          shadowColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: FloatingActionButton(
          onPressed: () => Get.back(),
          child: Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              CustomIcons.back,
              size: 16,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          mini: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: CustomDecoration.appBackgroundDecoration,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: halfOfTheScreen,
              child: Stack(
                children: [
                  Center(child: blur),
                  Center(
                    child: ProductDetailCachedImage(widget.productModel.photoUrl),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: halfOfTheScreen,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductRateWidget(widget.productModel.productStar.toString()),
                        const SizedBox(
                          width: 10,
                        ),
                        productPrice()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productModel.productName,
                          style: TextStyles.myPoppinsTextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              takeOutBasket(),
                              Obx(() => Text(
                                    amount.value.toString(),
                                    style: TextStyles.myPoppinsTextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              addBasket(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.productModel.productAbout,
                      style: TextStyles.myPoppinsTextStyle(
                        color: CustomColors.descriptionText,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Adds Ons',
                      style: TextStyles.myPoppinsTextStyle(
                        color: CustomColors.titleColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddsOnsWidget(AssetImageWidget(ImagePath.addsOns1)),
                        AddsOnsWidget(AssetImageWidget(ImagePath.addsOns2)),
                        AddsOnsWidget(AssetImageWidget(ImagePath.addsOns3)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Center(child: AddToCartButton(
                      onTap: () async {
                        widget.productModel.productAmount = amount.value;
                        if (widget.isAlreadyHave == true) {
                          basketViewModel.updateBasket(productModel: widget.productModel);
                        } else {
                          basketViewModel.addBasket(productModel: widget.productModel);
                        }
                        Get.back();
                      },)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  final Image blur = Image.asset(ImagePath.blur);
  Text productPrice() {
    return Text(
      r'$' + '${widget.productModel.productPrice}',
      style: TextStyles.myPoppinsTextStyle(
        color: CustomColors.productPriceText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  GestureDetector addBasket() {
    return GestureDetector(
      onTap: () {
        amount.value++;
      },
      child: const Icon(
        CustomIcons.add,
        size: 16,
        color: CustomColors.myPrimary,
      ),
    );
  }
  GestureDetector takeOutBasket() {
    return GestureDetector(
      onTap: () {
        if (amount.value > 1) {
          amount.value--;
        }
      },
      child: const Icon(
        CustomIcons.minus,
        size: 16,
        color: CustomColors.myPrimary,
      ),
    );
  }
}