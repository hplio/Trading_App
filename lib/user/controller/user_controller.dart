import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  final isPhotoUpload = false.obs;
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
      await fatchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final user = UserModel(
              id: userCredential.user!.uid,
              username: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '',
              photo: userCredential.user!.photoURL ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '');

          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      KLoader.errorSnackBar(
          title: 'Data not save',
          massage:
              'Something went wrong while saving your information. you cam re-save your data in your profile');
    }
  }

  Future<void> uploadUserProfilePic() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (image != null) {
        isPhotoUpload.value = true;
        final imageUrl =
            await userRepo.uplodeImage('User/Image/Profile/', image);
        Map<String, dynamic> json = {
          'Photo': imageUrl,
        };
        await userRepo.updateSingalField(json);
        user.value.photo = imageUrl;
        user.refresh();
        KLoader.successSnackBar(
            title: 'Congratulation',
            massage: 'Your profile pic has been updated!');
      }
    } catch (e) {
      KLoader.errorSnackBar(title: 'Oh snap!', massage: e.toString());
    } finally {
      isPhotoUpload.value = false;
    }
  }
   Future<void> copyId(String id) async {
    try {
      await Clipboard.setData(ClipboardData(text: id));
      KLoader.customToast(massage: 'Id copied to colipboard!');
    } catch (e) {
      throw 'somthing went wrong. please try again later.';
    }
  }
}