import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_learn/core/routing/app_routes.dart';
import 'package:new_learn/core/widgets/primay_button_widget.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/sticker.svg',
                  height: 100.sp,
                  width: 100.sp,
                ),
                SizedBox(height: 32.h),
                Text(
                  "Password Changed!",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF617AFD),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Your password has been successfully changed.\nYou can now log in with your new password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xFF838BA1),
                  ),
                ),
                SizedBox(height: 40.h),
                PrimayButtonWidget(
                  buttonText: "Back to Login",
                    onPressed:  () {
                    context.go(AppRoutes.loginScreen); // ← ده اللي يعمل Reset للتنقل
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


