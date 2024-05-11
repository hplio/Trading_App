import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/NSE_Stock/nse.dart';
import 'package:trading_app/constants/colors.dart';

class NSEStock extends StatelessWidget {
  const NSEStock({
    super.key,
    required this.stock,
    required this.stockName,
     this.iconButton,
  });
  final String stock;
  final String stockName;
  final Widget? iconButton;

  @override
  Widget build(BuildContext context) {
    // final bool dark = Theme.of(context).brightness == Brightness.dark;
    // final controller = Get.put(FavIcon());
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: double.maxFinite,
        child: GestureDetector(
          onTap: () => Get.to(
            () => CandlestickChart(
              stock: stock,
              stockName: stockName,
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
                  SizedBox(
                    child: Text(
                      stockName,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 3,
                          ),
                    ),
                  ),
                  iconButton!,
                  // IconButton(
                  //   onPressed: () {
                  //     controller.addStockIdAndName(stock, stockName);
                  //   },
                  //   icon: const Icon(
                  //     Icons.add,
                  //   ),
                  // ),
                  // btn?? const SizedBox(),
                  // // AddIconBtn(
                  // //   stock: stock,
                  // //   stockName: stockName,
                  // //   onPressed: () =>
                  // //       controller.addStockIdAndName(stock, stockName),
                  // // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
