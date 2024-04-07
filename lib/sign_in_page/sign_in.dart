import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/sign_in_page/widget/signin_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s create your account',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 25,
                ),
                 const SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

