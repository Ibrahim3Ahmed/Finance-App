import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/widgets/back_button_widget.dart';
import 'package:new_learn/core/widgets/primay_button_widget.dart';
import 'package:new_learn/features/auth/CreateNewPasswordScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

  int _start = 30;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _canResend = false;
    _start = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendCode() {
    print("Resend OTP tapped");
    // من هنا تحط لوجيك الإرسال الحقيقي
    startTimer(); // نعيد تشغيل العداد
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              SizedBox(height: 32.h),
              Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF617AFD),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Enter the verification code we just sent on your email address.",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xFF838BA1),
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40.h),

              // OTP Fields
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 60.w,
                      height: 60.h,
                      child: TextFormField(
                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: const Color(0xffF7F8F9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: Color(0xffE8ECF4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: Color(0xff617AFD),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 32.h),

              PrimayButtonWidget(
  buttonText: "Verify",
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      String otp = _otpControllers.map((c) => c.text).join();
      print("Entered OTP: $otp");

      // التنقل لصفحة إنشاء كلمة المرور
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateNewPasswordScreen(),
        ),
      );
    }
  },
),

              SizedBox(height: 330.h),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF617AFD),
                    ),
                    children: [
                      _canResend
                          ? TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _resendCode();
                                },
                            )
                          : TextSpan(
                              text: "Resend in $_start s",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
