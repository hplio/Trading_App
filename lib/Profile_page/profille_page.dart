import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/widget/app_featuers_tiles.dart';
import 'package:trading_app/Profile_page/widget/profile_tile.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/login_page/login_page.dart';

class ProfilePagge extends StatelessWidget {
  const ProfilePagge({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Harshil',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: dark ? TColor.white : TColor.darkerGrey,
                              ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_3_copy,
                            size: 15,
                            color: dark ? TColor.white : TColor.darkerGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Id: 46578 ',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: dark ? TColor.white : TColor.darkerGrey,
                              ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.copy_copy,
                            size: 15,
                            color: dark ? TColor.white : TColor.darkerGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'App Features',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const AppFeatureTiles(),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'App Settings',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ProfileTile(
                  onPress: () {},
                  iconData: Icons.settings,
                  title: 'My App',
                  subTitle: 'Edit Your Profile',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                      color: dark ? TColor.grey : TColor.darkerGrey,
                    )),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(const LoginPage());
                    },
                    child: const Text(
                      'Logout',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
