import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class   BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 41.h,
        width: 41.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xffE8ECF4), width: 1.w),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              context.pop(); // ✅ الرجوع للخلف باستخدام go_router
            },
           icon: SvgPicture.asset("assets/icons/back.svg")
          ),
        ),
      ),
    );
  }
}
