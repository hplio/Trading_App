import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/loader/loader.dart';
import 'package:trading_app/user/user_model.dart';
import 'package:trading_app/user/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  @override
  void onInit() {
    fatchUserRecord();
    super.onInit();
  }

  
  final userRepo = Get.put(UserReposetory());
  final profileLoding = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  Future<void> fatchUserRecord() async {
    try {
      profileLoding.value = true;
      final user = await userRepo.fatchUserDetaile();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoding.value = false;
    }
  }

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
