import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/network/network_manager.dart';
import 'package:trading_app/popups/full_screen_loder.dart';
import 'package:trading_app/sign_in_page/email_verification.dart';
import 'package:trading_app/user/user_model.dart';
import 'package:trading_app/user/user_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final userName = TextEditingController();
  final hidePassword = true.obs;
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final isAgree = false.obs;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  Future<void> signInUser() async {
    try {
      KFullScreenLoder.openLodingDialog(
          'We are processing your information... ',
          'Assets/animation/loading.json');
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!signInKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (isAgree.value != true) {
        KFullScreenLoder.stopLoading();
        KLoader.warningSnackBar(
            title: 'Accept Privacy Police',
            massage:
                'In Order to create account you have to accept privacy policy & terms of use');
        return;
      }

      final userCredential = await AuthRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
        email: email.text.trim(),
        id: userCredential.user!.uid,
        phoneNumber: phoneNumber.text.trim(),
        username: userName.text.trim(),
      );

      final authRepo = Get.put(UserReposetory());
      await authRepo.saveUserRecord(newUser);
      KFullScreenLoder.stopLoading();
      KLoader.successSnackBar(
          title: 'Congratulation', massage: 'Your account has been created.');

      Get.to(EmailVerificationPage(email: email.text.trim()));
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
