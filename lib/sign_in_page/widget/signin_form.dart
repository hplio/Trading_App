import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/common/terms_condition/terms_condition_text.dart';
import 'package:trading_app/sign_in_page/sign_in_controller/sign_in_ct.dart';
import 'package:trading_app/validators/validator.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
      key: controller.signInKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                Kvalidator.validateEmptyText('User Name', value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user), labelText: 'User Name'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) =>
                Kvalidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone), labelText: 'Phone Number'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => Kvalidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(
                Icons.mail,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => Kvalidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(
                  Iconsax.password_check,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Obx(
                  () => Checkbox(
                    value: controller.isAgree.value,
                    onChanged: (value) =>
                        controller.isAgree.value = !controller.isAgree.value,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const TermsAndConditionText(),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()=>controller.signInUser(),
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
