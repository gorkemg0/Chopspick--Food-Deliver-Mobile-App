import 'package:chopspick/global/component/image_path.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7,
            ),
            Text(
              "Promotions",
              style: TextStyles.myPoppinsTextStyle(
                color: CustomColors.titleColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(210, 22, 112, .87),
                      Color.fromRGBO(62, 31, 159, .68)
                    ],
                  ),
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        r"Today's Offer",
                        style: TextStyles.myPoppinsTextStyle(
                          color: CustomColors.promotionTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        r"Free Box of Fries",
                        style: TextStyles.myPoppinsTextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        r"On all others above $200",
                        style: TextStyles.myPoppinsTextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          ImagePath.fries_promotion,
          width: 120,
        )
      ],
    );
  }
}
