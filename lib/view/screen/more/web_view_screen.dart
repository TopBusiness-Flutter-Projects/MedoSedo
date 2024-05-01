import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:medosedo_ecommerce/view/basewidget/custom_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;
  WebViewScreen({required this.url, required this.title});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    print('xxxxxxxxxxxx${widget.url}');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Navigator.pop(context);
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (v) {
            print("urlxxxxxxxxx: ${v.url.toString()}");
            if (v.url
                .toString()
                .toLowerCase()
                .contains('api/payment/callback')) {
              //   Navigator.pop(context);
              //   Navigator.pop(context);
              // context.read<PaymentCubit>().checkPayment(v.url!);
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WebViewWidget(controller: _controller));
  }
}
