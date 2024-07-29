import 'package:flutter/material.dart';

import '../features/main/widgets/web_view.dart';
import '../features/home/home_screen.dart';
import '../features/loading/loading_screen.dart';

class Routes {
  static const String loading = '/';
  static const String home = '/home';
  static const String webView = '/webView';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      loading: (context) => const LoadingScreen(),
      home: (context) => HomeScreen(),
      webView: (context) => WebViewScreen(),
    };
  }
}
