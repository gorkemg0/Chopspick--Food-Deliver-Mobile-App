import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white);


  static TextStyle loginPageSubtitle({Color? color,FontWeight? fontWeight}){
    return GoogleFonts.poppins(
        fontSize: 16, fontWeight: fontWeight??FontWeight.w700, color: color??Colors.black);
  }

  static TextStyle dialogTextStyle =  GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle cartTextStyle = GoogleFonts.poppins(fontSize: 12,color: Colors.white);
  static TextStyle inputTextStyle = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color:Colors.white);



  static const TextStyle introPageSubtitleTextStyle = TextStyle(
    color: Color(0xff761616),
    fontWeight: FontWeight.w600,
  );

  static TextStyle myPoppinsTextStyle(
      {required Color color,
        required double fontSize,
        FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }



}
