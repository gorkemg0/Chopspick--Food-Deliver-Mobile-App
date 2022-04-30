import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/home_page/component/grid_view_build_item.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemBuilder extends StatelessWidget {
  OrderViewModel orderViewModel;
  BasketViewModel basketViewModel;

  ProductItemBuilder(this.orderViewModel, this.basketViewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Most Popular',
            style: TextStyles.myPoppinsTextStyle(
                color: CustomColors.titleColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
        Obx(() => Container(
              child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  children: orderViewModel.orderProducts.value
                      .map(
                          (e) => GridViewBuilderProductItem(e, basketViewModel))
                      .toList()),
            )),
      ],
    );
  }
}
