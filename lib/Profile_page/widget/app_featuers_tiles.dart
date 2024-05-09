import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/indicator.dart';
import 'package:trading_app/Profile_page/privacy_policy_page.dart';
import 'package:trading_app/Profile_page/widget/profile_tile.dart';
import 'package:trading_app/Profile_page/widget/show_about_us.dart';
import 'package:trading_app/wishlist_page/wishlist_main.dart';

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
            onPress: () => Get.to(()=>const Indicator()),
            iconData: Icons.drag_indicator,
            title: 'Indicator',
            subTitle: 'We Provide Information On Indicator Used In Our App',
          ),
          ProfileTile(
            onPress: () => Get.to(()=>const PrivacyPolicyPage()),
            iconData: Icons.privacy_tip,
            title: 'Privacy & Policy',
            subTitle: 'Detaile Information On Our App Privacy Policy',
          ),
          ProfileTile(
            onPress: () => Get.to(()=>const WishListMain()),
            iconData: Iconsax.bookmark,
            title: 'WishList',
            subTitle: 'Your Favorite Stock Or your Bookmark Stock Information.',
          ),
          ProfileTile(
            onPress: () => ShowAppDialog.showDialog(context),
            iconData: Icons.inbox_sharp,
            title: 'About Us',
            subTitle: 'Deteile Information On APP',
          ),
        ],
      ),
    );
  }
}


// ProfileTile(
//             onPress: () {},
//             iconData: Iconsax.calculator_copy,
//             title: 'Tools & Calculators',
//             subTitle: 'Brokerange, Margin calculator',
//           ),
//           ProfileTile(
//             onPress: () {},
//             iconData: Iconsax.receipt_1_copy,
//             title: 'My Reports',
//             subTitle: 'Portfolio, Tax, P&L, Transaction, Ledger',
//           ),