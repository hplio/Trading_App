// import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/size.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.file, required this.stockName});
  final String file;
  final String stockName;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String stockfile;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    stockfile = widget.file;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadFlutterAsset('Assets/html/$stockfile');
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_copy,
            color: dark ? TColor.white : TColor.black,
          ),
        ),
        title: Text(widget.stockName,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: SizedBox(
          height: KSizeScreen.getScreenHeight(context) * .6,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
