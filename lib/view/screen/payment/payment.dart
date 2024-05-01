import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/custom_themes.dart';
import '../../basewidget/animated_custom_dialog.dart';
import '../../basewidget/my_dialog.dart';
import '../dashboard/dashboard_screen.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({
    super.key,
    required this.addressID,
    required this.customerID,
    required this.couponCode,
    required this.billingId,
    this.orderNote,
    this.couponCodeAmount,
    this.paymentMethod,
  });
  final String addressID;
  final String billingId;
  final String? orderNote;
  final String customerID;
  final String couponCode;
  final String? couponCodeAmount;
  final String? paymentMethod;

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  String selectedUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    selectedUrl =
        '${AppConstants.BASE_URL}/customer/payment-mobile?customer_id='
        '${widget.customerID}&address_id=${widget.addressID}&coupon_code='
        '${widget.couponCode}&coupon_discount=${widget.couponCodeAmount}&billing_address_id=${widget.billingId}&order_note=${widget.orderNote}&payment_method=${widget.paymentMethod}';
    print(selectedUrl);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Navigator.pop(context);
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (v) {
            print("urlxxxxxxxxx: ${v.url.toString()}");
            if (v.url.toString().toLowerCase().contains('success=false')) {
              onExit();
              //   Navigator.pop(context);
              //   Navigator.pop(context);
              // context.read<PaymentCubit>().checkPayment(v.url!);
            } else if (v.url
                .toString()
                .toLowerCase()
                .contains('success=true')) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => DashBoardScreen()),
                  (route) => false);

              showAnimatedDialog(
                  context,
                  MyDialog(
                    icon: Icons.done,
                    title: getTranslated('payment_done', context),
                    description: getTranslated(
                        'your_payment_successfully_done', context),
                  ),
                  dismissible: false,
                  isFlip: true);
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
      ..loadRequest(Uri.parse(selectedUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text(getTranslated('PAYMENT', context), style: robotoBold),
          ),
          body: WebViewWidget(controller: _controller)),
    );
  }

  void onExit() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);

    showAnimatedDialog(
        context,
        MyDialog(
          icon: Icons.clear,
          title: getTranslated('payment_failed', context),
          description: getTranslated('your_payment_failed', context),
          isFailed: true,
        ),
        dismissible: false,
        isFlip: true);

    print("\n\nBrowser closed!\n\n");
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => DashBoardScreen()),
          (route) => false);
      showAnimatedDialog(
          context,
          MyDialog(
            icon: Icons.clear,
            title: getTranslated('payment_cancelled', context),
            description: getTranslated('your_payment_cancelled', context),
            isFailed: true,
          ),
          dismissible: false,
          isFlip: true);
      return Future.value(true);
    }
  }
}
