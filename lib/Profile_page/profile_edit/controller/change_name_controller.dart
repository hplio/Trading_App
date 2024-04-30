import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Profile_page/user_detaile_page.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/network/network_manager.dart';
import 'package:trading_app/popups/full_screen_loder.dart';
import 'package:trading_app/user/controller/user_controller.dart';
import 'package:trading_app/user/user_repository.dart';

class ChangeNameController extends GetxController {
  @override
  void onInit() {
    inistialize();
    super.onInit();
  }

  static ChangeNameController get instance => Get.find();

  final name = TextEditingController();
  final GlobalKey<FormState> changeNameKey = GlobalKey<FormState>();
  final userController = Get.put(UserReposetory());
  final userModelController = Get.put(UserController());

  inistialize() {
    name.text = userModelController.user.value.username;
  }

  Future<void> changeUserNameFromScreen() async {
    try {
      KFullScreenLoder.openLodingDialog(
          'We are Upadating your name..', 'Assets/animation/loading.json');
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!changeNameKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      final Map<String, dynamic> json = {
        'UserName': name.text.trim(),
      };

      await userController.updateSingalField(json);
      KFullScreenLoder.stopLoading();
      userModelController.user.value.username = name.text.trim();
      userModelController.user.refresh();
      KLoader.successSnackBar(
          title: 'Congratulation', massage: 'Your name has been updated');
      Get.off(() => const UserDetailPage());
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }

 
}
