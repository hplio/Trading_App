import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Profile_page/user_detaile_page.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/network/network_manager.dart';
import 'package:trading_app/popups/full_screen_loder.dart';
import 'package:trading_app/user/controller/user_controller.dart';
import 'package:trading_app/user/user_repository.dart';

class ChangePhoneNumberController extends GetxController {
  @override
  void onInit() {
    inistialize();
    super.onInit();
  }

  static ChangePhoneNumberController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> changePhoneNumberKey = GlobalKey<FormState>();
  final controller = Get.put(UserReposetory());
  final userController = Get.put(UserController());
  inistialize() {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> changeUserPhoneNumberFromScreen() async {
    try {
      KFullScreenLoder.openLodingDialog('We are Upadating your Phone Number..',
          'Assets/animation/loading.json');
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!changePhoneNumberKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      final Map<String, dynamic> json = {
        'PhoneNumber': phoneNumber.text.trim(),
      };

      await controller.updateSingalField(json);
      KFullScreenLoder.stopLoading();
      userController.user.value.phoneNumber = phoneNumber.text.trim();
      userController.user.refresh();
      KLoader.successSnackBar(
          title: 'Congratulation', massage: 'Your name has been updated');
      Get.off(() => const UserDetailPage());
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
