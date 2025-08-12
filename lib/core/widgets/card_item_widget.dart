import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_assets.dart';
import 'package:new_learn/core/styling/app_styles.dart';

class CardItemWidget extends StatelessWidget {
  final Color backgroundColor;
  final String cardName;
  final String balance;
  final String cardNumber;
  final String expiryDate;

  const CardItemWidget({
    super.key,
    required this.backgroundColor,
    required this.cardName,
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 207.w,
          height: 263.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            AppAssets.layer2Image,
            width: 207.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            AppAssets.layer1Image,
            width: 120.w,
            height: 130.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 24.w,
          top: 24.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardName,
                style: AppStyles.black18boldStyles.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 57.h),
              Text(
                "Balance",
                style: AppStyles.grey12w400Styles.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xffFDFDFD),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                balance,
                style: AppStyles.black18boldStyles.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 26.h,
          left: 24.w,
          child: Text(
            cardNumber,
            style: AppStyles.black18boldStyles.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 26.h,
          right: 24.w,
          child: Text(
            expiryDate,
            style: AppStyles.grey12w400Styles.copyWith(
              fontSize: 12.sp,
              color: const Color(0xffFDFDFD),
            ),
          ),
        ),
      ],

    );
  }
}

