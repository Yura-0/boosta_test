import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/consts.dart';
import 'widgets/question_card.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

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
            QuestionCard(
                headerText: Consts.firstQustionHeader,
                contentText: Consts.firstQustionText),
            QuestionCard(
                headerText: Consts.secondQustionHeader,
                contentText: Consts.secondQustionText),
            QuestionCard(
                headerText: Consts.thirdQustionHeader,
                contentText: Consts.thirdQustionText),
            QuestionCard(
                headerText: Consts.fourthQustionHeader,
                contentText: Consts.fourthQustionText),
            QuestionCard(
                headerText: Consts.fifthQustionHeader,
                contentText: Consts.fifthQustionText),
            QuestionCard(
                headerText: Consts.sixthQustionHeader,
                contentText: Consts.sixthQustionText),
            QuestionCard(
                headerText: Consts.seventhQustionHeader,
                contentText: Consts.seventhQustionText),
            QuestionCard(
                headerText: Consts.eighthQustionHeader,
                contentText: Consts.eighthQustionText),
            QuestionCard(
                headerText: Consts.ninethQustionHeader,
                contentText: Consts.ninethQustionText),
            QuestionCard(
                headerText: Consts.tenthQustionHeader,
                contentText: Consts.tenthQustionText),
            QuestionCard(
                headerText: Consts.eleventhQustionHeader,
                contentText: Consts.eleventhQustionText),
          ],
        ),
      ),
    );
  }
}
