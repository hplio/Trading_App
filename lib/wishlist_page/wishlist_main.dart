import 'package:flutter/material.dart';
import 'package:trading_app/common/custom_app_bar/ktabbar.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/wishlist_page/nse_page/wishlist_page.dart';
import 'package:trading_app/wishlist_page/wishlist_nasdaq_page/wishlist_nasdaq.dart';

class WishListMain extends StatelessWidget {
  const WishListMain({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (_, isScrolled) {
            return [
              SliverAppBar(
                floating: false,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 30,
                backgroundColor: dark ? Colors.black : TColor.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 24),
                  child: ListView(
                    shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics() ,
                    children: [
                      Text(
                        'WishList',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                bottom: const KTabBar(
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  tabList: [
                    Text('NASDAQ'),
                    Text('NSE'),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              WishListNasdaqPage(),
              WishListNsePage(),
            ],
          ),
        ),
      ),
    );
  }
}
