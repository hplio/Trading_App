import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/Chart/chart.dart';
import 'package:trading_app/constants/colors.dart';

class ListViaCsv extends StatelessWidget {
  const ListViaCsv({
    super.key,
    required this.fileName,
    required this.stockName,
  });

  final String fileName;
  final String stockName;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: double.maxFinite,
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
                GestureDetector(
                  onTap: () => Get.to(
                    () => MainPage(
                      file: fileName,
                      stockName: stockName,
                    ),
                  ),
                  child: SizedBox(
                    child: Text(
                      stockName,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 3,
                          ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: dark ? TColor.white : TColor.darkerGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
