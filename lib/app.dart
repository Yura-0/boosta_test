import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BoostyTestApp extends StatelessWidget {
  const BoostyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: const Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      );
    });
  }
}
