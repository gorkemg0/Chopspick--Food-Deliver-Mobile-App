import 'package:chopspick/global/component/loading_widget.dart';
import 'package:chopspick/global/styles/custom_decoration.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/landing_page/landing_page.dart';
import 'package:chopspick/screens/login_page/component/gmail_login_widget.dart';
import 'package:chopspick/screens/login_page/component/login_button.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageBody extends StatefulWidget {
  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  UserViewModel _userModel = Get.find();
  final _formkey = GlobalKey<FormState>();
  String? email, password, password2;

  Future<void> _formSubmit(BuildContext context) async {
    _formkey.currentState!.save();
    if (_formkey.currentState!.validate() &&
        _userModel.state != ViewState.Busy) {
      if (password == password2) {
        try {
          _userModel.state = ViewState.Busy;
          var result = await _userModel.createUserWithEmailAndPassword(email!, password!);
          if (result!=null) {
            await _userModel.currentUser();
            setState(() {});
            Get.offAll(LandingPage());
          }
        } catch (e) {
          //catch
        }
        _userModel.state = ViewState.idle;
      } else {
        Get.snackbar(
          "ERROR",
          "Passwords must match",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: CustomDecoration.loginPageBackgroundDecoration,
          child: Column(
            children: [
              upperPartWidget(),
              lowerPartWidget(context),
            ],
          ),
        ),
        Obx(() =>
            _userModel.state == ViewState.Busy ? LoadingWidget() : Container()),
      ],
    );
  }

  Flexible upperPartWidget() {
    return Flexible(
      flex: 1,
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text("Create an Account",style: TextStyles.myPoppinsTextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyles.inputTextStyle,
                validator: (value) {
                  if (value != null && value.isEmail) {
                    return null;
                  } else {
                    return 'Please enter valid text';
                  }
                },
                decoration: CustomDecoration.loginPageInputDecoration(
                    hintText: "Email"),
                onSaved: (String? value) {
                  email = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyles.inputTextStyle,
                obscureText: true,
                validator: (value) {
                  if (value != null && value.length >= 3) {
                    return null;
                  } else {
                    return 'Password must be longer than 3 characters';
                  }
                },
                decoration: CustomDecoration.loginPageInputDecoration(
                    hintText: "Password"),
                onSaved: (String? value) {
                  password = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value != null && value.length >= 3) {
                    return null;
                  } else {
                    return 'Password must be longer than 3 characters';
                  }
                },
                style: TextStyles.inputTextStyle,
                decoration: CustomDecoration.loginPageInputDecoration(
                    hintText: "Confirm Password"),
                onSaved: (String? value) {
                  password2 = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible lowerPartWidget(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: CustomDecoration.loginPageLowerPartDecoration,
        child: Column(
          children: [
            LoginButton(
                buttonText: "Sing Up", onTap: () => _formSubmit(context)),
            SizedBox(
              height: 30,
            ),
            Text(
              "-Or Sign in with-",
              style: TextStyles.loginPageSubtitle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            GoogleLoginWidget(),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Do you have an account?  ",
                      style: TextStyles.loginPageSubtitle()),
                  TextSpan(
                    text: "Sign in",
                    style: TextStyles.loginPageSubtitle(color: Colors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.back();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
