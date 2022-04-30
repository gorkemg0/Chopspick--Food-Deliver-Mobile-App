import 'package:chopspick/global/component/image_path.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/custom_decoration.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/login_page/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final Image introImage = Image.asset(ImagePath.intro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: CustomDecoration.appBackgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                child: introImage,
                margin: EdgeInsets.all(10),
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyles.myPoppinsTextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
                // style: TextStyles.introPageMainTextStyle,
                children: const [
                  TextSpan(text: 'Your everyday '),
                  TextSpan(
                    text: 'meal \n',
                    style: TextStyles.introPageSubtitleTextStyle,
                  ),
                  TextSpan(text: 'delivered '),
                  TextSpan(
                    text: 'to you ',
                    style: TextStyles.introPageSubtitleTextStyle,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => LoginPage());
              },
              child: Container(
                width: 175,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyles.myPoppinsTextStyle(
                      color: CustomColors.introPageButtonText,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
