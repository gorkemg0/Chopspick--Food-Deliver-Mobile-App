import 'package:chopspick/global/component/image_path.dart';
import 'package:chopspick/screens/landing_page/landing_page.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleLoginWidget extends StatelessWidget {
  UserViewModel _userModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _userModel.signInWithGoogle();
        Get.offAll(LandingPage());
      },
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        width: 80,
        height: 35,
        child: Image.asset(ImagePath.googleIcon),
      ),
    );
  }
}
