import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';
import '../features/loading/loading_screen.dart';

class Routes {
  static const String loading = '/';
  static const String home = '/home';
  static const String main = '/main';
  static const String privacyPolicy = '/privacy-policy';
  static const String terms = '/terms';
  static const String faq = '/faq';
  static const String appSupport = '/app-support';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      loading: (context) => const LoadingScreen(),
      home: (context) => const HomeScreen(),
      // main: (context) => MainScreen(),
      // privacyPolicy: (context) => PrivacyPolicyScreen(),
      // terms: (context) => TermsScreen(),
      // faq: (context) => FAQScreen(),
      // appSupport: (context) => AppSupportScreen(),
    };
  }
}