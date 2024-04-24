import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/bottom_navigationbar/bottom_navigation.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/network/network_manager.dart';
import 'package:trading_app/popups/full_screen_loder.dart';
import 'package:trading_app/user/user_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final ischeck = false.obs;
  final showPassword = true.obs;
  final storage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserReposetory());

  @override
  void onInit() {
    if (storage.read('REMEMBER_ME_EMAIL') != null &&
        storage.read('REMEMBER_ME_PASSWORD') != null) {
      emailController.text = storage.read('REMEMBER_ME_EMAIL');
      passwordController.text = storage.read('REMEMBER_ME_PASSWORD');
    }
    super.onInit();
  }

  Future<void> login() async {
    try {
      KFullScreenLoder.openLodingDialog('We are processing your information...',
          'Assets/animation/loading.json');

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (ischeck.value) {
        storage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        storage.write('REMEMBER_ME_PASSWORD', passwordController.text.trim());
      }
      await AuthRepo.instance.logInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      KFullScreenLoder.stopLoading();
      Get.offAll(const BottomNavigation());
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.errorSnackBar(title: 'oh snap', massage: e.toString());
    }
  }

  signInWithGoole() async {
    try {
      KFullScreenLoder.openLodingDialog(
          'LogIn you in...', 'assets/images/animation/animation_loading.gif');
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      final userCredential =
          await AuthRepo.instance.signInWithGoogleUsingEmail();
    } catch (e) {}
  }
}
