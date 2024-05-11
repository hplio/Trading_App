import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/user_detaile_page.dart';
import 'package:trading_app/Profile_page/widget/app_featuers_tiles.dart';
import 'package:trading_app/Profile_page/widget/profile_tile.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/common/img_container/circuler_img_container.dart';
import 'package:trading_app/common/loader/shimmer.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/user/controller/user_controller.dart';

class ProfilePagge extends StatelessWidget {
  const ProfilePagge({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = UserController.instance;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () {
                                if (controller.profileLoding.value) {
                                  return const KShimmerEffect(
                                      hight: 80, width: 80);
                                } else {
                                  return Text(
                                    controller.user.value.username,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                          color: dark
                                              ? TColor.white
                                              : TColor.darkerGrey,
                                        ),
                                  );
                                }
                              },
                            ),
                            IconButton(
                              onPressed: () =>
                                  Get.to(() => const UserDetailPage()),
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
                            Obx(
                              () {
                                if (controller.profileLoding.value) {
                                  return const KShimmerEffect(
                                      hight: 80, width: 80);
                                } else {
                                  return SizedBox(
                                    width: 90,
                                    child: Text(
                                      'Id: ${controller.user.value.id}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                            color: dark
                                                ? TColor.white
                                                : TColor.darkerGrey,
                                          ),
                                    ),
                                  );
                                }
                              },
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.copyId(controller.user.value.id),
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
                    GestureDetector(
                      onTap: () => Get.to(() => const UserDetailPage()),
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
                            : Hero(
                              tag: 'ProfilePic',
                              child: KCirculerImage(
                                  imgString: image,
                                  hight: 85,
                                  width: 85,
                                  isNetworkImg: networkImage.isNotEmpty,
                                ),
                            );
                      }),
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
                  'App Information',
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
                  onPress: () => Get.to(() => const UserDetailPage()),
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
                      ),
                    ),
                    onPressed: () => AuthRepo.instance.logOut(),
                    child: const Text(
                      'Logout',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
