import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/constants/size.dart';
import 'package:trading_app/constants/text.dart';
import 'package:trading_app/forget_password/controller/forget_password_controller.dart';
import 'package:trading_app/login_page/login_page.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: KSizeScreen.getScreenHeight(context) * .32,
                image: const AssetImage(
                  'Assets/animation/success_verified.gif',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                KtextString.emailResetTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                KtextString.emailResetSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const LoginPage()),
                  child: const Text(
                    'Done',
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () => controller.reSendforgetPasswordSendLink(email),
                child: const Text(
                  'Resend Email',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
