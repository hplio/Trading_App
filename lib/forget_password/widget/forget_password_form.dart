import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/forget_password/controller/forget_password_controller.dart';
import 'package:trading_app/validators/validator.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Form(
      key: controller.forgetPasswordKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.fEmail,
            validator: (value) => Kvalidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(
                Icons.email,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.forgetPasswordSendLink(),
              child: const Text(
                'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
