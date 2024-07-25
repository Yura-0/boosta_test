import 'package:flutter/material.dart';

import '../privacy_policy/widgets/text_card.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
