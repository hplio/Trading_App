import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final ischeck = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

 
}
