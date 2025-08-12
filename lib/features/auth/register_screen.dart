import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_learn/core/routing/app_routes.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/core/styling/app_styles.dart';
import 'package:new_learn/core/widgets/back_button_widget.dart';
import 'package:new_learn/core/widgets/custom_text_filed.dart';
import 'package:new_learn/core/widgets/primay_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackButtonWidget(),
                          SizedBox(height: 24.h),
                          Text(
                            'Hello! Register to get\nstarted',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF6C7CE7),
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 40.h),
                      
                          // Username Field
                          CustomTextFiled(
                            controller: _usernameController,
                            hintText: 'Username',
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z؀-ۿ\s]"),
                              ),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                      
                          // Email Field
                          CustomTextFiled(
                            controller: _emailController,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (!value.contains('@')) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                      
                          // Password Field
                          CustomTextFiled(
                            controller: _passwordController,
                            hintText: 'Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                      
                          // Confirm Password Field
                          CustomTextFiled(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 32.h),
                      
                          // Register Button
                          PrimayButtonWidget(
                            buttonText: "Register",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(
                                  'Register data: ${_usernameController.text}, ${_emailController.text}',
                                );
                              }
                            },
                          ),
                          SizedBox(height: 32.h),
                      
                          _buildDivider(),
                          SizedBox(height: 24.h),
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSocialIcon('assets/icons/facebook.svg'),
                              _buildSocialIcon('assets/icons/google.svg'),
                              _buildSocialIcon('assets/icons/apple.svg'),
                            ],
                          ),
                      
                          SizedBox(height: 32.h),
                          Center(child: _buildLoginLink()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFE0E0E0))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Or Register with',
            style: TextStyle(color: const Color(0xFF888888), fontSize: 14.sp),
          ),
        ),
        Expanded(child: Divider(color: const Color(0xFFE0E0E0))),
      ],
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
          child: SvgPicture.asset(
            assetPath,
            width: 12.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style: AppStyles.black16w500Style.copyWith(
          color: AppColors.primaryColor,
        ),
        children: [
          TextSpan(
            text: "Login Now",
            style: AppStyles.black15boldStyles,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(AppRoutes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}





