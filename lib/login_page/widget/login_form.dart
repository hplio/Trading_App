import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/bottom_navigationbar/bottom_navigation.dart';
import 'package:trading_app/constants/size.dart';
import 'package:trading_app/forget_password/forget_password_screen.dart';
import 'package:trading_app/sign_in_page/sign_in.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .018,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
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
                    child: Checkbox(
                      value: false,
                     onChanged: (value) {}),
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
            height: KSizeScreen.getScreenHeight(context) * .03,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()=>Get.to(const BottomNavigation()),
              child: const Text('Log in'),
            ),
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .015,
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
