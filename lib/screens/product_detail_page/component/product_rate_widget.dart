import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class ProductRateWidget extends StatelessWidget {
  String productStar;
  ProductRateWidget(this.productStar);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 75,
      decoration: BoxDecoration(
        color: CustomColors.myPrimary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CustomIcons.product_star,
            color: CustomColors.starColor ,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            productStar,
            style: TextStyles.myPoppinsTextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
