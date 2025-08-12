import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_learn/core/styling/app_assets.dart';
import 'package:new_learn/core/styling/app_colors.dart';
import 'package:new_learn/features/auth/profile%20page/profile_page_screen.dart';
import 'package:new_learn/features/card_screen/card_screen.dart';
import 'package:new_learn/features/home_page/home_page_screen.dart';
import 'package:new_learn/features/statistics/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  
  // Fixed: Now has exactly 5 screens to match the 5 BottomNavigationBar items
  final List<Widget> screens = [
    HomePageScreen(), // Home
    StatisticsScreen(),   // Statistics
    Container(width: double.infinity, height: double.infinity, color: Colors.green),  // Plus
       CardsScreen(),
  // My card
    ProfilePage()// Profile
  ];
  
  @override
  Widget build(BuildContext context) {
    // Debug: Print current values
    debugPrint("currentIndex: $currentIndex, screens.length: ${screens.length}");
    
    return SafeArea(
      child: Scaffold(
        body: currentIndex < screens.length ? screens[currentIndex] : screens[0],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Essential for 5+ items
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            if (value >= 0 && value < screens.length) {
              setState(() {
                currentIndex = value;
              });
              log("Tapped index: $value");
            } else {
              log("Invalid index: $value, screens length: ${screens.length}");
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.homeSVGIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.chartSVGIcon),
              label: 'Statstic',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(AppAssets.plusSVGIcon),
              ),
              label: 'Plus',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.waletSVGIcon),
              label: 'My card',
            ),
            BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profileSVGIcon),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

