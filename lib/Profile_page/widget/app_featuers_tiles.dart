import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/widget/profile_tile.dart';

class AppFeatureTiles extends StatelessWidget {
  const AppFeatureTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.verify_copy,
            title: 'Super Saver Pack',
            subTitle: 'Ultra Trader Pack, Power Inveestor Pack',
          ),
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.money_2_copy,
            title: 'Financial Products',
            subTitle: 'Mutual Funds, Insurance, Gold, IPO',
          ),
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.box_add_copy,
            title: 'Derivatives',
            subTitle: 'Quick Option Trade, Option Chain',
          ),
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.receipt_search_copy,
            title: 'Research',
            subTitle: 'Short & Long Term Calls, Screeners, News',
          ),
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.calculator_copy,
            title: 'Tools & Calculators',
            subTitle: 'Brokerange, Margin calculator',
          ),
          ProfileTile(
            onPress: () {},
            iconData: Iconsax.receipt_1_copy,
            title: 'My Reports',
            subTitle: 'Portfolio, Tax, P&L, Transaction, Ledger',
          ),
        ],
      ),
    );
  }
}
