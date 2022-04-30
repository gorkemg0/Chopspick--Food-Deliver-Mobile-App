import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomDecoration {
  static const Decoration loginPageLowerPartDecoration = BoxDecoration(
    color: Color.fromRGBO(141, 52, 164, .43),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(32),
      topLeft: Radius.circular(32),
    ),
  );

  static Decoration loginPageBackgroundDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        CustomColors.loginPageLinearColor1,
        CustomColors.loginPageLinearColor2
      ]));

  static InputDecoration loginPageInputDecoration({required String hintText}) {
    UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(borderSide: BorderSide(width: 3));
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyles.inputTextStyle,
      border: underlineInputBorder,
      focusedErrorBorder: underlineInputBorder,
      errorBorder: underlineInputBorder,
      enabledBorder: underlineInputBorder,
      disabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
    );
  }

  static Decoration appBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xffD11770),
        const Color(0xff644AB5).withOpacity(.87)
      ],
    ),
  );
}
