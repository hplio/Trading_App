import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/Chart/chart.dart';
import 'package:trading_app/constants/colors.dart';

class HTMLFileChart extends StatelessWidget {
  const HTMLFileChart({
    super.key,
    // required this.fileName,
    required this.stockName,
    required this.symbol,
    this.iconBtn,
    this.assetName,
    this.showImage = false,
  });

  // final String fileName;
  final String stockName;
  final String symbol;
  final Widget? iconBtn;
  final String? assetName;
  final bool? showImage;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: double.maxFinite,
        child: GestureDetector(
          onTap: () => Get.to(
            () => MainPage(
              // file: fileName,
              stockName: stockName,
              symbol: symbol,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: TColor.primary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showImage!)
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: dark ? TColor.black : TColor.light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                          fit: BoxFit.fill, image: AssetImage(assetName ?? '')),
                    ),
                  SizedBox(
                    child: Text(
                      stockName,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 3,
                          ),
                    ),
                  ),
                  iconBtn!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
