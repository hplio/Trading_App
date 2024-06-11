import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/size.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key, required this.file, required this.stockName});
//   final String file;
//   final String stockName;

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   late String stockfile;
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     stockfile = widget.file;
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadFlutterAsset('Assets/html/$stockfile');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool dark = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () => Get.back(),
//           child: Icon(
//             Iconsax.arrow_left_copy,
//             color: dark ? TColor.white : TColor.black,
//           ),
//         ),
//         title: Text(widget.stockName,
//             style: Theme.of(context).textTheme.headlineMedium),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: SizedBox(
//           height: KSizeScreen.getScreenHeight(context) * .78,
//           child: WebViewWidget(
//             controller: controller,
//           ),
//         ),
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage(
      {super.key,
      required this.symbol,
      required this.stockName,});
  final String symbol;
  final String stockName;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String stockfile;
  late WebViewController controller;

  static String symbol1 = '';

  @override
  void initState() {
    super.initState();
    // stockfile = widget.file;
    symbol1 = widget.symbol;
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
      ..loadRequest(
        Uri.dataFromString(
          '''
              <!-- TradingView Widget BEGIN -->
              <!-- TradingView Widget BEGIN -->
                <div class="tradingview-widget-container" style="height:100%;width:100%">
                  <div class="tradingview-widget-container__widget" style="height:calc(100% - 32px);width:100%"></div>
                  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js" async>
                  {
                  "container_id": "analytics-platform-chart-demo",
                  "width": "100%",
                  "height": "100%",
                  "autosize": true,
                  "symbol": "$symbol1",
                  "interval": "D",
                  "timezone": "exchange",
                  "theme": "dark",
                  "style": "1",
                  "withdateranges": true,
                  "allow_symbol_change": true,
                  "save_image": false,
                  "details": true,
                  "hotlist": true,
                  "calendar": false
                }
                  </script>
                </div>
                <!-- TradingView Widget END -->
              ''',
          mimeType: 'text/html',
        ),
      );
    // ..loadFlutterAsset('Assets/html/$stockfile');
  }

  String widgetScript = '''
      {
        "container_id": "analytics-platform-chart-demo",
        "width": "100%",
        "height": "100%",
        "autosize": true,
        "symbol": $symbol1, // Injecting the symbol variable here
        "interval": "D",
        "timezone": "exchange",
        "theme": "light",
        "style": "0",
        "withdateranges": true,
        "allow_symbol_change": true,
        "save_image": false,
        "details": true,
        "hotlist": true,
        "calendar": false
      }
    ''';

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
          height: KSizeScreen.getScreenHeight(context) * .78,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}

