import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle headingStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle subtitleStyles = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );
  static TextStyle black16w500Style = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
   static TextStyle grey12w400Styles = TextStyle(


     fontFamily: AppFonts.mainFont,
      fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor

  );
  static TextStyle black15boldStyles = TextStyle(


     fontFamily: AppFonts.mainFont,
      fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
  static TextStyle black18boldStyles = TextStyle(


     fontFamily: AppFonts.mainFont,
      fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
}
