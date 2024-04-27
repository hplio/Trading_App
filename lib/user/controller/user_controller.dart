import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/user/user_model.dart';
import 'package:trading_app/user/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserReposetory());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            username: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '');

        userRepo.saveUserRecord(user);
      }
    } catch (e) {
      KLoader.errorSnackBar(
          title: 'Data not save',
          massage:
              'Something went wrong while saving your information. you cam re-save your data in your profile');
    }
  }
}
