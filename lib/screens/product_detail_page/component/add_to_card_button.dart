import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  VoidCallback onTap;
  AddToCartButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: CustomColors.myPrimary,
        ),
        child: Center(
          child: Text(
            'Add to Card',
            textAlign: TextAlign.center,
            style: TextStyles.myPoppinsTextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
