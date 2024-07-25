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
      selectedItemColor: const Color.fromARGB(255, 32, 78, 246),
      unselectedItemColor: const Color.fromARGB(255, 192, 192, 192),
      onTap: onItemTapped,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Color.fromARGB(255, 32, 78, 246),),
      unselectedLabelStyle: const TextStyle(color: Color.fromARGB(255, 192, 192, 192)),
    );
  }
}
