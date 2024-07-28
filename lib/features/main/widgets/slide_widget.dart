import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/image_assets.dart';

class SlideWidget extends StatelessWidget {
  final String imagePath;
  final String headText;
  final String text;
  final bool showLeftArrow;
  final bool showRightArrow;
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;

  const SlideWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.showLeftArrow,
    required this.showRightArrow,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
    required this.headText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Adaptive.h(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Adaptive.h(4), bottom: Adaptive.h(1)),
                    child: Text(
                      headText,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2050F6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showLeftArrow)
          Positioned(
            left: 15,
            top: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onLeftArrowPressed,
                child: Image.asset(
                  ImgAssets.leftArrow,
                  width: Adaptive.h(4),
                  height: Adaptive.h(4),
                ),
              ),
            ),
          ),
        if (showRightArrow)
          Positioned(
            right: 15,
            top: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onRightArrowPressed,
                child: Image.asset(
                  ImgAssets.rightArrow,
                  width: Adaptive.h(4),
                  height: Adaptive.h(4),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
