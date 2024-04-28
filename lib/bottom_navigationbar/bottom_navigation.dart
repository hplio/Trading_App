import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/profille_page.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/live_page/live_page_1.dart';
import 'package:trading_app/wishlist_page/wishlist_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.curruntPage.value,
          onDestinationSelected: (value) =>
              controller.curruntPage.value = value,
          backgroundColor: dark ? TColor.black : TColor.white,
          indicatorColor:
              dark ? TColor.grey.withOpacity(.1) : TColor.black.withOpacity(.1),
          height: 62,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Iconsax.book_saved,
              ),
              label: 'Live',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.heart,
              ),
              label: 'WishList',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.user,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.container[controller.curruntPage.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> curruntPage = 0.obs;
  final container = <Widget>[
    const LivePageScreen(),
    const WishListPage(),
    const ProfilePagge(),
  ];
}
