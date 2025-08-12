import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_learn/core/routing/app_routes.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/core/styling/app_styles.dart';
import 'package:new_learn/core/widgets/back_button_widget.dart';
import 'package:new_learn/core/widgets/custom_text_filed.dart';
import 'package:new_learn/core/widgets/primay_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  const BackButtonWidget(),
                  SizedBox(height: 20.h),
                  SizedBox(
                width: 280.w,
               
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: AppStyles.headingStyle,
                      ),
                      Text(
                        "Again!",
                        style: AppStyles.headingStyle,
                        ),
                      ],
                    ),
                    ) ,
                
              
              
                  SizedBox(height: 32.h),
              
                  CustomTextFiled(
                    controller: emailController,
                    hintText: "Enter your email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
              
                  CustomTextFiled(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              
                  SizedBox(height: 10.h),
              
                  Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.forgetPassword); // ← هنا بيتنقل
                  },
                  child: Text(
                    "Forget Password?",
                    style: AppStyles.black16w500Style.copyWith(
                      color: const Color(0xff6A707C),
                    ),
                  ),
                ),
              ),
              
              
                  SizedBox(height: 18.h),
              
                 PrimayButtonWidget(
                buttonText: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Logging in with ${emailController.text}");
              
                    // التنقل إلى صفحة الهوم
                    context.go(AppRoutes.homeScreen);
                  }
                },
              ),
              
              
                  SizedBox(height: 30.h),
              
                  Row(
                    children: [
                      SizedBox(width: 100.w, child: const Divider()),
                      SizedBox(width: 12.w),
                      Text(
                        "or Login with",
                        style: AppStyles.black15boldStyles.copyWith(
                          color: const Color(0xff6A707C),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      SizedBox(width: 100.w, child: const Divider()),
                    ],
                  ),
              
                  SizedBox(height: 22.h),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSocialIcon('assets/icons/facebook.svg'),
                      _buildSocialIcon('assets/icons/google.svg'),
                      _buildSocialIcon('assets/icons/apple.svg'),
                    ],
                  ),
              
                  SizedBox(height: 130.h),
              
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppStyles.black16w500Style.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: AppStyles.black15boldStyles,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoutes.registerScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 56.h,
        width: 105.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xffE8ECF4), width: 1.w),
        ),
        child: Center(
          child: SvgPicture.asset(assetPath, width: 12.w, height: 24.h),
        ),
      ),
    );
  }
}


