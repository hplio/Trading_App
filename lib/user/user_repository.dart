import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/authenticatin_repository/firebase_exception.dart';
import 'package:trading_app/user/user_model.dart';

class UserReposetory extends GetxController {
  static UserReposetory get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final authController = Get.put(AuthRepo());

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('UserDetaile').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Something went wrong.please try again later.';
    }
  }
}
