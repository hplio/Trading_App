import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_app/authenticatin_repository/firebase_exception.dart';
import 'package:trading_app/login_page/login_page.dart';
import 'package:trading_app/onbording_page/onbording.dart';

class AuthRepo extends GetxController {
  @override
  void onReady() {
    screenRedirect();
    super.onReady();
  }

  static AuthRepo get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  screenRedirect() {
    deviceStorage.writeIfNull('isFirstTime', true);
    if (deviceStorage.read('isFirstTime') != true) {
      Get.offAll(const LoginPage());
    } else {
      Get.offAll(const OnBordingPage());
    }
  }

  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went Wrong.Please try again later.';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went Wrong.Please try again later.';
    }
  }

  Future<void> sendEmailVerificationLink(String email) async {
    try {
      return _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went Wrong.Please try again later.';
    }
  }
}
