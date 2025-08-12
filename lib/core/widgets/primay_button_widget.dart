import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_colors.dart';

class PrimayButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;

  const PrimayButtonWidget({
    super.key,
    required this.buttonText, // ← مطلوب
    this.fontSize,
    this.buttonColor,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        minimumSize: Size(width ?? 100, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}

