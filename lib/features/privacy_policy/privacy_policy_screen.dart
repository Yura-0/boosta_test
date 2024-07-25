import 'package:flutter/material.dart';

import 'widgets/text_card.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextCard(),
          TextCard(),
        ],
      ),
    );
  }
}
