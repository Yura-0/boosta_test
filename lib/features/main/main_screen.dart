import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/image_assets.dart';
import '../../core/routes.dart';
import 'widgets/circle_widget.dart';
import 'widgets/slide_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _openWebView() {
    Navigator.pushNamed(context, Routes.webView);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.w(4),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Adaptive.h(3)),
            Text(
              "Get Cash Advance",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                "in 3 easy steps",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Adaptive.h(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWidget(index: 0, isSelected: _currentIndex == 0),
                  Container(
                    width: Adaptive.w(5),
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                  ),
                  CircleWidget(index: 1, isSelected: _currentIndex == 1),
                  Container(
                    width: Adaptive.w(5),
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                  ),
                  CircleWidget(index: 2, isSelected: _currentIndex == 2),
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(42),
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  SlideWidget(
                    imagePath: ImgAssets.slide1,
                    headText: "Complete the Form",
                    text:
                        "Fill out a straightforward form to request your cash",
                    showLeftArrow: false,
                    showRightArrow: true,
                    onLeftArrowPressed: () =>
                        _navigateToPage(_currentIndex - 1),
                    onRightArrowPressed: () =>
                        _navigateToPage(_currentIndex + 1),
                  ),
                  SlideWidget(
                    imagePath: ImgAssets.slide2,
                    headText: "Loan Agreement",
                    text: "Review and sign the loan agreement to continue",
                    showLeftArrow: true,
                    showRightArrow: true,
                    onLeftArrowPressed: () =>
                        _navigateToPage(_currentIndex - 1),
                    onRightArrowPressed: () =>
                        _navigateToPage(_currentIndex + 1),
                  ),
                  SlideWidget(
                    imagePath: ImgAssets.slide3,
                    headText: "Receive Money Quickly",
                    text: "Wait for the cash to be transferred to your account",
                    showLeftArrow: true,
                    showRightArrow: false,
                    onLeftArrowPressed: () =>
                        _navigateToPage(_currentIndex - 1),
                    onRightArrowPressed: () =>
                        _navigateToPage(_currentIndex + 1),
                  ),
                ],
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            SizedBox(
              height: Adaptive.h(6),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 78, 246),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: _openWebView,
                child: Text(
                  'Get Cash',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(ImgAssets.privacyPolicy),
                  color: Color.fromARGB(255, 32, 78, 246),
                ),
                SizedBox(width: 5),
                Text(
                  "Your data is safe & secure",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
