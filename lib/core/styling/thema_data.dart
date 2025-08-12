import 'package:flutter/material.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/core/styling/app_fonts.dart';
import 'package:new_learn/core/styling/app_styles.dart';
class AppThemes {
  static final  lightTheme = ThemeData(
    primaryColor:AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFont,
    textTheme: TextTheme(
      titleLarge:AppStyles.headingStyle,
      titleMedium: AppStyles.subtitleStyles,

    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor
     
    ),
  );
  

 
}