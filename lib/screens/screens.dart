import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Screen 2"),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  UserViewModel _userModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () async {
              await _userModel.signOut();
              _userModel.currentUser();
            },
            child: Text("Sign Out"),
          ),
        ),
      ),
    );
  }
}
