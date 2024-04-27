import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/size.dart';
import 'package:trading_app/forget_password/forget_password_screen.dart';
import 'package:trading_app/login_page/controller/login_controller.dart';
import 'package:trading_app/sign_in_page/sign_in.dart';
import 'package:trading_app/validators/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) => Kvalidator.validateEmail(value),
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .018,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => Kvalidator.validatePassword(value),
              controller: controller.passwordController,
              obscureText: controller.showPassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.showPassword.value =
                      !controller.showPassword.value,
                  icon: Icon(
                    controller.showPassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Obx(
                      () => Checkbox(
                          value: controller.ischeck.value,
                          onChanged: (value) => controller.ischeck.value =
                              !controller.ischeck.value),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Remember Me',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              InkWell(
                onTap: () => Get.to(const ForgetPasswordScreen()),
                child: Text(
                  'Forget Password?',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .025,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text('Log in'),
            ),
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .02,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(const SignInPage()),
              child: const Text(
                'Create Account',
              ),
            ),
          )
        ],
      ),
    );
  }
}
