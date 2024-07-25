import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/consts.dart';

class TextCard extends StatelessWidget {
  const TextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Adaptive.h(2),
      ),
      child: Container(
        padding: const EdgeInsets.all(13),
        width: double.infinity,
        height: Adaptive.h(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Consts.privacyHeaderText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Text(
                    Consts.privacyPolicyText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: (constraints.maxHeight / 25).floor(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

