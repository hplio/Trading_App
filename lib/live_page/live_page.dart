import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:trading_app/Chart/chart.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  Widget list(BuildContext context, String fileName, String stockName) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: TColor.primary,
              )),
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

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                KtextString.homeAppBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: dark ? TColor.grey : TColor.darkerGrey),
              ),
              Text(
                KtextString.homeAppBarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: dark ? TColor.white : TColor.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              list(context, "apple.html", "Apple"),
              list(context, "amazon.html", "Amazon"),
              list(context, "amd.html", "Amd"),
              list(context, "google.html", "Google"),
              list(context, "meta.html", "Meta"),
              list(context, "microsoft.html", "Microsoft"),
              list(context, "netflix.html", "Netflix"),
              list(context, "nvdia.html", "Nvidia"),
              list(context, "tesla.html", "Tesla"),
            ],
          ),
        ),
      ),
    );
  }
}
