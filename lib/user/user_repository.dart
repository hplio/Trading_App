import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/authenticatin_repository/firebase_exception.dart';
import 'package:trading_app/user/user_model.dart';

class UserReposetory extends GetxController {
  static UserReposetory get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final authController = Get.put(AuthRepo());

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('UserDetails').doc(user.id).set(user.toJson());
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

  Future<UserModel> fatchUserDetaile() async {
    try {
      final documentSnapshot = await _db
          .collection('UserDetails')
          .doc(authController.curuuntUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  Future<void> updateSingalField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('UserDetails')
          .doc(authController.curuuntUser!.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<String> uplodeImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }
}
