import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_learn/core/styling/app_assets.dart';
import 'package:new_learn/core/widgets/card_item_widget.dart';
import 'package:new_learn/core/widgets/carousel_widget.dart';
import 'package:new_learn/core/widgets/custom_home_page_item.dart';
import 'package:new_learn/core/widgets/top_profile_notification_widget.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18),
            TopProfileNotificationWidget(),
            SizedBox(height: 18),
            CustomCarouselWidget(
              cards: [
                CardItemWidget(
                  backgroundColor: Colors.blue,
                  cardName: "X Card",
                  balance: "2300 EG",
                  cardNumber: "**** 3435",
                  expiryDate: "12/24",
                ),
                CardItemWidget(
                  backgroundColor: Colors.green,
                  cardName: "Y Card",
                  balance: "1500 EG",
                  cardNumber: "**** 9876",
                  expiryDate: "01/26",
                ),
                CardItemWidget(
                  backgroundColor: Color(0xff4151A6),
                  cardName: "v Card",
                  balance: "18000 EG",
                  cardNumber: "**** 9076",
                  expiryDate: "02/26",
                ),
              ],
            ),
            SizedBox(height: 24.h),
            // استبدال Expanded بـ SizedBox مع height
            SizedBox(
              height: 300.h, // عدل الرقم حسب الحاجة
              child: GridView(
                physics: NeverScrollableScrollPhysics(), // يمنع التمرير داخل GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.sp,
                  crossAxisSpacing: 16.sp,
                  childAspectRatio: 1,
                ),
                children: [
                  CustomHomePageItem(
                    imageWidget: SvgPicture.asset(AppAssets.sendSVGIcon),
                    title: "Send money",
                    description: "Take acc to acc",
                  ),
                  CustomHomePageItem(
                    imageWidget: SvgPicture.asset(AppAssets.walletSVGIcon),
                    title: "Pay the bill",
                    description: "Lorem ipsum",
                  ),
                  CustomHomePageItem(
                    imageWidget: SvgPicture.asset(AppAssets.requestSVGIcon),
                    title: "Request",
                    description: "Lorem ipsum",
                  ),
                  CustomHomePageItem(
                    imageWidget: SvgPicture.asset(AppAssets.userSVGIcon),
                    title: "Contact",
                    description: "Lorem ipsum",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


