import 'package:chopspick/global/component/loading_widget.dart';
import 'package:chopspick/global/styles/custom_decoration.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/landing_page/landing_page.dart';
import 'package:chopspick/screens/login_page/component/gmail_login_widget.dart';
import 'package:chopspick/screens/login_page/component/login_button.dart';
import 'package:chopspick/screens/login_page/component/text_field.dart';
import 'package:chopspick/screens/login_page/register_page/register_page.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageBody extends StatefulWidget {
  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  UserViewModel _userModel = Get.find();
  final _formkey = GlobalKey<FormState>();
  String? email, password;

  Future<void> _formSubmit(BuildContext context) async {
    _formkey.currentState!.save();
    if (_formkey.currentState!.validate() &&
        _userModel.state != ViewState.Busy) {
      try {
        var result = await _userModel.signInWithEmailAndPassword(email!, password!);
        if (result!=null) {
          await _userModel.currentUser();
          setState(() {});
          Get.offAll(LandingPage());
        }
      } catch (e) {
        //catch
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
              child: Text("Login to your Account",style: TextStyles.myPoppinsTextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            TextFieldLoginWidget(
              inputValidator: (value) {
                if (value != null && value.isEmail) {
                  return null;
                } else {
                  return 'Please enter valid text';
                }
              },
              onSaved: (String? value) {
                email = value;
              },
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              hintText: "Email",
            ),
            TextFieldLoginWidget(
              inputValidator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return 'Password must be longer than 6 characters';
                }
              },
              onSaved: (String? value) {
                password = value;
              },
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              hintText: "Password",
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
              buttonText: "Sign In",
              onTap: () => _formSubmit(context),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "-Or Sign in with-",
              style: TextStyles.loginPageSubtitle(
                fontWeight: FontWeight.w500,
              ),
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
                      text: "Don't have an account?  ",
                      style: TextStyles.loginPageSubtitle()),
                  TextSpan(
                    text: "Sign up",
                    style: TextStyles.loginPageSubtitle(color: Colors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => RegisterPage(),
                            transition: Transition.circularReveal);
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
