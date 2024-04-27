import 'package:flutter/material.dart';
import 'package:trading_app/common/custom_app_bar/ktabbar.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';
import 'package:trading_app/live_page/screens/nasdaq_stock_screen.dart';
import 'package:trading_app/live_page/screens/nse_stock_screen.dart';

class LivePageScreen extends StatelessWidget {
  const LivePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, isScroled) {
              return [
                SliverAppBar(
                  floating: false,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: 220,
                  backgroundColor: dark ? Colors.black : TColor.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Text(
                          KtextString.homeAppBarTitle,
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: dark ? TColor.grey : TColor.darkerGrey),
                        ),
                        Text(
                          KtextString.homeAppBarSubTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: dark ? TColor.white : TColor.black),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      dark ? TColor.grey : TColor.darkerGrey)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: 'Search Here!'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: const KTabBar(
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    tabList: [
                      Text('NSE'),
                      Text('NASDAQ'),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(children: [
              NseScreen(),
              NasdaqScreen(),
            ])),
      ),
    );
  }
}
