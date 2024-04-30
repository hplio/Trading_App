import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Profile_page/profile_edit/controller/change_phone_controller.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/validators/validator.dart';

class UserPhoneNumberChangeScreen extends StatelessWidget {
  const UserPhoneNumberChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePhoneNumberController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Change PhoneNumber',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'To change your PhoneNumber type your PhoneNumber below.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.changePhoneNumberKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          Kvalidator.validatePhoneNumber(value),
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(
                          Icons.phone,
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
                            controller.changeUserPhoneNumberFromScreen(),
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
