import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/common/img_container/circuler_img_container.dart';
import 'package:trading_app/common/profile/profile_tile.dart';
import 'package:trading_app/constants/colors.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'User Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: KCirculerImage(
                  imgString: 'Assets/images/profile_img/User-img.png',
                  hight: 80,
                  width: 80,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Change Photo',
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              Text(
                'User Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16 * 1.5,
              ),
              UserProfileTile(
                title: 'Username',
                subTitle: 'HarshilPatel',
                onPressed: () {},
              ),
              UserProfileTile(
                title: 'User Id',
                subTitle: '4567',
                iconData: Iconsax.copy,
                onPressed: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Personal Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              UserProfileTile(
                title: 'Email',
                subTitle: 'hplion02@gmail.com',
                onPressed: () {},
              ),
              UserProfileTile(
                title: 'PhoneNumber',
                subTitle: '9087654321',
                onPressed: () {},
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: TColor.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
