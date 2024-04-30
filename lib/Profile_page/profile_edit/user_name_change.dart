import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/Profile_page/profile_edit/controller/change_name_controller.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/validators/validator.dart';

class UserNameChangeScreen extends StatelessWidget {
  const UserNameChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'To change your name type your username below.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.changeNameKey ,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.name,
                      validator: (value) =>
                          Kvalidator.validateEmptyText('User Name', value),
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>controller.changeUserNameFromScreen(),
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
