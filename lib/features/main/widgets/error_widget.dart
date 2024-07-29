import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/image_assets.dart';

class ErrorWebWidget extends StatefulWidget {
  final void Function() onReload;
  final Future<bool> Function() checkConnection;
  final bool isLoading;

  const ErrorWebWidget({
    Key? key,
    required this.onReload,
    required this.checkConnection,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<ErrorWebWidget> createState() => _ErrorWebWidgetState();
}

class _ErrorWebWidgetState extends State<ErrorWebWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoReload();
  }

  void _startAutoReload() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final hasConnection = await widget.checkConnection();
      if (hasConnection) {
        timer.cancel();
        widget.onReload();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 230, 235, 255),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              height: Adaptive.h(15),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 32, 78, 246),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: Adaptive.h(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Adaptive.w(5),
                        height: Adaptive.h(4),
                        child: const Image(
                          image: AssetImage(
                            ImgAssets.point,
                          ),
                        ),
                      ),
                      Text(
                        "CASH POINT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Adaptive.h(25),
                    width: Adaptive.w(50),
                    child: const Image(
                      image: AssetImage(
                        ImgAssets.internetError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(4),
                  ),
                  const Text(
                    'Please check your internet connection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: Adaptive.h(19)),
                  SizedBox(
                    height: Adaptive.h(6),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 32, 78, 246),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: widget.onReload,
                      child: widget.isLoading
                          ? const SpinKitCircle(
                              color: Colors.white,
                              size: 24.0,
                            )
                          : Text(
                              'Try Again',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
