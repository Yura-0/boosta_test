import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/image_assets.dart';

class SuccessWidget extends StatelessWidget {
  final VoidCallback closeSuccessScreen;
  const SuccessWidget({super.key, required this.closeSuccessScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 230, 235, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: Adaptive.h(15),
              width: Adaptive.h(15),
              child: const Image(
                image: AssetImage(
                  ImgAssets.appSupCheck,
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            Text(
              'Your message succesfully submited.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Adaptive.h(0.5)),
            Text(
              'Out support will contact you as soon as possible.',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Adaptive.h(25)),
            SizedBox(
              height: Adaptive.h(6),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: closeSuccessScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 78, 246),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(4)),
          ],
        ),
      ),
    );
  }
}
