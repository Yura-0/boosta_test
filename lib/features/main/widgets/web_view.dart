import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/image_assets.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  bool _isError = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isError = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com'));

    if (!_isLoading) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        _controller.reload();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isError)
            Container(
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
                                backgroundColor:
                                    const Color.fromARGB(255, 32, 78, 246),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isError = false;
                                  _isLoading = true;
                                });
                                _controller.reload();
                              },
                              child: Text(
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
            )
          else
            WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
