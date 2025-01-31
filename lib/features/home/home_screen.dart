import 'package:flutter/material.dart';

import '../app_support/app_support_screen.dart';
import '../faq/faq_screen.dart';
import '../main/main_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms/terms_screen.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/custome_app_bar.dart';
import 'widgets/custome_page_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

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
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 235, 255),
      body: Column(
        children: [
          CustomAppBar(
            title: _getTitle(),
            showBackButton: false,
            onBackButtonPressed: () {},
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          Expanded(
            child: CustomPageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _widgetOptions,
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
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
        return 'Terms of Use';
      case 3:
        return 'FAQ';
      case 4:
        return 'App Support';
      default:
        return '';
    }
  }
}
