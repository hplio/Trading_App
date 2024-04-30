import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/profile_edit/change_phone_number_screen.dart';
import 'package:trading_app/Profile_page/profile_edit/user_name_change.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/common/img_container/circuler_img_container.dart';
import 'package:trading_app/common/loader/shimmer.dart';
import 'package:trading_app/common/profile/profile_tile.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/user/controller/user_controller.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
              Center(
                child: Obx(() {
                  final networkImage = controller.user.value.photo;
                  final image = networkImage.isNotEmpty
                      ? networkImage
                      : 'Assets/images/profile_img/User-img.png';
                  return controller.isPhotoUpload.value
                      ? const KShimmerEffect(
                          hight: 85,
                          width: 85,
                          radius: 85,
                        )
                      : KCirculerImage(
                          imgString: image,
                          hight: 85,
                          width: 85,
                          isNetworkImg: networkImage.isNotEmpty,
                        );
                }),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.uploadUserProfilePic(),
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
              Obx(() {
                if (controller.profileLoding.value) {
                  return const KShimmerEffect(hight: 20, width: 40);
                } else {
                  return UserProfileTile(
                    title: 'Username',
                    subTitle: controller.user.value.username,
                    onPressed: () => Get.to(() => const UserNameChangeScreen()),
                  );
                }
              }),
              Obx(() {
                if (controller.profileLoding.value) {
                  return const KShimmerEffect(hight: 20, width: 40);
                } else {
                  return UserProfileTile(
                    title: 'User Id',
                    subTitle: controller.user.value.id,
                    iconData: Iconsax.copy_copy,
                    onPressed: () {},
                  );
                }
              }),
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
              Obx(
                () {
                  if (controller.profileLoding.value) {
                    return const KShimmerEffect(hight: 20, width: 40);
                  } else {
                    return UserProfileTile(
                      title: 'Email',
                      iconData: null,
                      subTitle: controller.user.value.email,
                    );
                  }
                },
              ),
              Obx(
                () {
                  if (controller.profileLoding.value) {
                    return const KShimmerEffect(hight: 20, width: 40);
                  } else {
                    return UserProfileTile(
                      title: 'PhoneNumber',
                      subTitle: controller.user.value.phoneNumber,
                      onPressed: () =>
                          Get.to(() => const UserPhoneNumberChangeScreen()),
                    );
                  }
                },
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
