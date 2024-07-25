import 'package:flutter/material.dart';

import '../../../core/image_assets.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ImgAssets.home)),
          label: 'Main',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ImgAssets.privacyPolicy)),
          label: 'Privacy Policy',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ImgAssets.terms)),
          label: 'Terms',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ImgAssets.faq)),
          label: 'FAQ',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ImgAssets.support)),
          label: 'App Support',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
    );
  }
}
