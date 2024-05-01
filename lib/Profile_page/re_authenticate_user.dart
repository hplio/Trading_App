import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/user/controller/user_controller.dart';
import 'package:trading_app/validators/validator.dart';

class ReAuthLogInForm extends StatelessWidget {
  const ReAuthLogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Re-Authenticate User',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.reAuthFromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => Kvalidator.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidepassword.value,
                    validator: (value) => Kvalidator.validatePassword(value),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                        icon: Icon(
                          controller.hidepassword.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text(
                      'Submit',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
