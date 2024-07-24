import 'package:flutter/material.dart';

import '../app_support/app_support_screen.dart';
import '../faq/faq_screen.dart';
import '../main/main_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms/terms_screen.dart';
import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    const PrivacyPolicyScreen(),
    const TermsScreen(),
    const FAQScreen(),
    const AppSupportScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        leading: _selectedIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            if (_selectedIndex != 0) {
              setState(() {
                _selectedIndex = 0;
              });
            }
          }
        },
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Main';
      case 1:
        return 'Privacy Policy';
      case 2:
        return 'Terms';
      case 3:
        return 'FAQ';
      case 4:
        return 'App Support';
      default:
        return '';
    }
  }
}
