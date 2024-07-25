import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackButtonPressed,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.h(12),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 78, 246),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: selectedIndex == 0
          ? Center(
              child: Padding(
                padding: EdgeInsets.only(top: Adaptive.h(2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Adaptive.w(5),
                      height: Adaptive.h(4),
                      child: const Image(
                        image: AssetImage(
                          ImgAssets.point,
                        ),
                      ),
                    ),
                    Text(
                      "CASH POINT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                  top: Adaptive.h(2),
                  left: Adaptive.w(5),
                  right: Adaptive.w(5)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage(ImgAssets.arrowBack),
                        color: Colors.white),
                    onPressed: () {
                      onItemTapped(0);
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: Adaptive.w(10)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
