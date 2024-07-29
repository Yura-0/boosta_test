import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/image_assets.dart';
import 'error_widget.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _controller;
  bool _isError = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkInternetAndLoad();
  }

  Future<void> _checkInternetAndLoad() async {
    bool hasConnection = await _checkInternetConnection();
    if (hasConnection) {
      _initializeWebView();
    } else {
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void _initializeWebView() {
    setState(() {
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
                _isError = false; 
              });
            },
            onWebResourceError: (WebResourceError error) async {
              bool hasConnection = await _checkInternetConnection();
              if (!hasConnection) {
                setState(() {
                  _isError = true;
                });
              }
            },
          ),
        )
        ..loadRequest(Uri.parse('https://www.google.com'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isError
          ? null
          : AppBar(
              backgroundColor: const Color.fromARGB(255, 32, 78, 246),
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: Adaptive.w(10)),
                  child: Text(
                    "CASH POINT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const ImageIcon(AssetImage(ImgAssets.arrowBack),
                    color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: Stack(
        children: [
          if (_isError)
            ErrorWebWidget(
              isLoading: _isLoading,
              onReload: () async {
                bool hasConnection = await _checkInternetConnection();
                if (hasConnection) {
                  setState(() {
                    _isError = false;
                    _isLoading = true;
                  });
                  _initializeWebView();
                }
              },
              checkConnection: _checkInternetConnection,
            )
          else if (_controller != null)
            WebViewWidget(controller: _controller!)
          else
            ErrorWebWidget(
              isLoading: _isLoading,
              onReload: () async {
                bool hasConnection = await _checkInternetConnection();
                if (hasConnection) {
                  setState(() {
                    _isError = false;
                    _isLoading = true;
                  });
                  _initializeWebView();
                }
              },
              checkConnection: _checkInternetConnection,
            ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
