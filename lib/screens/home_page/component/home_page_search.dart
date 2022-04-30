import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:flutter/material.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.searchBackground,
          borderRadius: BorderRadius.circular(32)),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintStyle: TextStyles.myPoppinsTextStyle(
              color: CustomColors.searchInputHintText,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 11),
            child: Icon(
              Icons.search,
              color: CustomColors.searchIcon,
              size: 30,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
