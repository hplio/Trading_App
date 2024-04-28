import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_app/authenticatin_repository/firebase_exception.dart';
import 'package:trading_app/bottom_navigationbar/bottom_navigation.dart';
import 'package:trading_app/login_page/login_page.dart';
import 'package:trading_app/onbording_page/onbording.dart';
import 'package:trading_app/sign_in_page/email_verification.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo extends GetxController {
  @override
  void onReady() {
    screenRedirect();
    super.onReady();
  }

  static AuthRepo get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get curuuntUser => _auth.currentUser;

  screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(
          () => const BottomNavigation(),
        );
      } else {
        Get.offAll(
          () => EmailVerificationPage(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);

      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(const LoginPage())
          : Get.offAll(const OnBordingPage());
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

  Future<UserCredential> signInWithGoogleUsingEmail() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      return _auth.signInWithCredential(credential);
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

  Future<void> sendEmailVerificationLink() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
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

  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(const LoginPage());
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

  Future<void> sendResetPasswordLinkViaEmail(String email) async {
    try {
     return await _auth.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch (e) {
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
