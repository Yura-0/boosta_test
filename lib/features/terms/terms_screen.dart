import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../privacy_policy/widgets/text_card.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextCard(),
            TextCard(),
          ],
        ),
      ),
    );
  }
}
