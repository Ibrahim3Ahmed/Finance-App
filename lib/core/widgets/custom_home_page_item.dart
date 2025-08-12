import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_styles.dart';

class CustomHomePageItem extends StatelessWidget {
  final Widget imageWidget;
  final String title;
  final String description;

  const CustomHomePageItem({
    super.key,
    required this.imageWidget,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E9ED), width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffECF1F6),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: imageWidget, // ✅ هنا بنحط الودجت مباشرة
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: AppStyles.black15boldStyles,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppStyles.grey12w400Styles,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}


