import 'package:chopspick/global/component/loading_widget.dart';
import 'package:chopspick/screens/intro_page.dart';
import 'package:chopspick/screens/landing_page/nav_bar_widget.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<UserViewModel> {
  UserViewModel _userModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_userModel.state == ViewState.idle) {
          if (_userModel.user == null || _userModel.user!.email == "") {
            return IntroPage();
          } else {
            return BottomNavBarWidget();
          }
        } else {
          return SpinKitCubeGrid(color: Colors.red,);
        }
      },
    );
  }
}
