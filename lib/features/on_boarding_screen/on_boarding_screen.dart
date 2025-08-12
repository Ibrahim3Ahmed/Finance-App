import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_learn/core/routing/app_routes.dart';
import 'package:new_learn/core/styling/app_assets.dart';
import 'package:new_learn/core/styling/app_styles.dart';
import 'package:new_learn/core/widgets/outline_primay_button.dart';
import 'package:new_learn/core/widgets/primay_button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Column(
     
        children: [
          Image.asset(AppAssets.generated,
          width: double.infinity,
          height: 570.h,
          fit: BoxFit.fill,
          ),
          SizedBox(height: 21.h),
          PrimayButtonWidget(
            width: 331.w,
            height: 56.h,
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
            },
            buttonText:"Login",

          ),
          SizedBox(height: 15.h),
          PrimayOutlineButtonWidget(
         width: 331.w,
          height: 56.h,
           onPressed: () {
             GoRouter.of(context).pushNamed(AppRoutes.registerScreen);
            },
                 buttonText: "Register",
),


          
          SizedBox(height: 46.h),

          Text("Continue as a guest",style:AppStyles.black15boldStyles.copyWith(
            color: Color(0xff202955),
            decoration: TextDecoration.underline,

          ),
          
          ),
          SizedBox(height: 20.h),


        ],
      )
       
    );
  }
}