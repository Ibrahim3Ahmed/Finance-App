// custom_carousel_widget.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselWidget extends StatefulWidget {
  final List<Widget> cards;

  const CustomCarouselWidget({super.key, required this.cards});

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 263.h,
            padEnds: false,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndexPage = index;
              });
            },
          ),
          items: widget.cards,
        ),
        const SizedBox(height: 16),
        DotsIndicator(
          dotsCount: widget.cards.length,
          position: currentIndexPage.toDouble(),
          decorator: DotsDecorator(
            spacing: EdgeInsets.symmetric(horizontal: 4),
            color: Color(0xffE3E9ED),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ]
    );
  }
}

