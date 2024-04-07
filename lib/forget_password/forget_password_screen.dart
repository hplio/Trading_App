import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_copy,
            color: dark ? TColor.white : TColor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text(
                KtextString.fPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                KtextString.fPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              const SizedBox(
                height: 24,
              ),
              const TextField(
                decoration: InputDecoration(
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
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
