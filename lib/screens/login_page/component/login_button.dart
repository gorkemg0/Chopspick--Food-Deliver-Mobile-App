import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String buttonText;
  VoidCallback onTap;
  LoginButton({required this.buttonText,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: CustomColors.activeColor,
            borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          buttonText,
          style: TextStyles.buttonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
