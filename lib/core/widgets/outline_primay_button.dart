import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_colors.dart';

class PrimayOutlineButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? bordercolor;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;
  const PrimayOutlineButtonWidget({
    super.key,
    this.buttonText,
    this.fontSize,
    this.bordercolor,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        //backgroundColor: bordercolor ?? AppColors.primaryColor,
        minimumSize: Size(width ?? 100, height ?? 50),
        side: BorderSide(color: bordercolor ?? AppColors.primaryColor,width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? '',
        style: TextStyle(color: textColor ?? AppColors.primaryColor,
        fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 16.sp),
      ),
    );
  }
}