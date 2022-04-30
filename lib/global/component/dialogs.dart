import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs{


  errorDialog({required String contentText}){
    Get.defaultDialog(
        radius: 8,
        title: "ERROR!",
        content: Text(contentText,style: TextStyles.dialogTextStyle,));
  }
}