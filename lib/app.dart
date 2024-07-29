import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/routes.dart';

class BoostyTestApp extends StatelessWidget {
  const BoostyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: Routes.loading,
          routes: Routes.getRoutes(),
        );
      },
    );
  }
}
