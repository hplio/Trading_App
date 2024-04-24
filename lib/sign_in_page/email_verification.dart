import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'package:trading_app/constants/text.dart';
import 'package:trading_app/sign_in_page/sign_in_controller/email_verification_controller.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key,  this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthRepo.instance.logOut(),
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
              const Image(
                image: AssetImage('Assets/animation/verificatin.gif'),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                KtextString.emailV,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                email!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                KtextString.emailVerifyDis,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>controller.checkEmailVerificationStatus(),
                  child: const Text(
                    'Continue',
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              TextButton(
                onPressed: ()=>controller.sendEmailVerificationLink(),
                child: const Text(
                  'ReSend Email',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
