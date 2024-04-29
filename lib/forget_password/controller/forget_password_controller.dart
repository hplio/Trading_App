import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/forget_password/reset_password_screen.dart';
import 'package:trading_app/network/network_manager.dart';
import 'package:trading_app/popups/full_screen_loder.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final fEmail = TextEditingController();
  final GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  Future<void> forgetPasswordSendLink() async {
    try {
      KFullScreenLoder.openLodingDialog(
          'We are proccesing your request...', 'Assets/animation/loading.json');

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }

      if (!forgetPasswordKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }

      await AuthRepo.instance.sendResetPasswordLinkViaEmail(fEmail.text.trim());
      KLoader.successSnackBar(
        title: 'Email sent',
        massage:
            'Email link sent to reset password please check your mail box.',
      );
      KFullScreenLoder.stopLoading();
      Get.offAll(
        () => ResetPasswordScreen(
          email: fEmail.text.trim(),
        ),
      );
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }

  Future<void> reSendforgetPasswordSendLink(String email) async {
    try {
      KFullScreenLoder.openLodingDialog(
          'We are proccesing your request...', 'Assets/animation/loading.json');

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }

      await AuthRepo.instance.sendResetPasswordLinkViaEmail(email);
      KFullScreenLoder.stopLoading();
      KLoader.successSnackBar(
        title: 'Email sent',
        massage:
            'Email link sent to reset password please check your mail box.',
      );
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
