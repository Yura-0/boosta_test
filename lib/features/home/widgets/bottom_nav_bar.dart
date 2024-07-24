import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Main',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.privacy_tip),
          label: 'Privacy Policy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Terms',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'FAQ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support),
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
