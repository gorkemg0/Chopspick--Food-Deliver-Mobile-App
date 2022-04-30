import 'package:chopspick/global/styles/custom_decoration.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldLoginWidget extends StatelessWidget {
  FormFieldValidator<String> inputValidator;
  FormFieldSetter<String> onSaved;
  TextInputType textInputType;
  bool obscureText;
  String hintText;

  TextFieldLoginWidget(
      {required this.inputValidator,
      required this.onSaved,
      required this.textInputType,
      required this.obscureText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        keyboardType: textInputType,
        style: TextStyles.inputTextStyle,
        obscureText: obscureText,
        validator: inputValidator,
        decoration:
            CustomDecoration.loginPageInputDecoration(hintText: hintText),
        onSaved: onSaved,
      ),
    );
  }
}
