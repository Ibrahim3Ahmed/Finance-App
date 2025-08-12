import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_learn/core/styling/app_assets.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/core/styling/app_styles.dart';

class TopProfileNotificationWidget extends StatelessWidget {
  const TopProfileNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        
                Row(
                  children: [
        
                    ClipOval(child: Image.asset(AppAssets.profileImage,width: 48.w,height: 48.h,
                    fit: BoxFit.fill,)),
        
                    SizedBox(width: 11,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text("Welcome back",style:AppStyles.grey12w400Styles.copyWith(
                          fontSize: 12,color: const Color(0xff6A707C)
        
                        )
                        
                        ),
                        const SizedBox(height: 2),
                         Text("Ibrahim Ahmed",style:AppStyles.black18boldStyles
                        
                        )
        
                      ],
                      
                    )
                  ],
                ),
                Container(
                  width: 48.w,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape:BoxShape.circle,
                  border:Border.all(color:Color(0xffE3E9ED),width: 1 ) 
                   ),
                   child: Icon(Icons.notifications,size: 24,
                   color:AppColors.primaryColor ,
                   ),
        
                  
                )
              ],
            );
  }
}