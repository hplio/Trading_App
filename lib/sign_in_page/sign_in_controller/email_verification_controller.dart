import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/common/success_screen/success_screen.dart';
import 'package:trading_app/constants/text.dart';

class EmailVerificationController extends GetxController {
  @override
  void onInit() {
    sendEmailVerificationLink();
    setTimeForAutoRedirection();
    super.onInit();
  }

  static EmailVerificationController get instance => Get.find();

  Future<void> sendEmailVerificationLink() async {
    try {
      await AuthRepo.instance.sendEmailVerificationLink();
      KLoader.successSnackBar(
          title: 'Email sent', massage: 'Please check your mail box');
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }

  setTimeForAutoRedirection() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccsessScreen(
              imageString: "Assets/images/sucsses/verification_success.png",
              title: KtextString.sucssessFullT,
              subTitle: KtextString.sucssessFullDis,
              onPress: () => AuthRepo.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final curruntUser = FirebaseAuth.instance.currentUser;

    if (curruntUser != null && curruntUser.emailVerified) {
      Get.off(
        () => SuccsessScreen(
          imageString: "Assets/images/sucsses/verification_success.png",
          title: KtextString.sucssessFullT,
          subTitle: KtextString.sucssessFullDis,
          onPress: () => AuthRepo.instance.screenRedirect(),
        ),
      );
    }
  }
}
