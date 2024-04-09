import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:trading_app/bottom_navigationbar/bottom_navigation.dart';
import 'package:trading_app/login_page/login_page.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    late String email;
    late String password;
    late final user;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const TextField(
          //   decoration: InputDecoration(
          //     labelText: 'User Name',
          //     prefixIcon: Icon(
          //       Iconsax.user,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          TextField(
            onChanged: (value) => email = value,
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
          // const TextField(
          //   decoration: InputDecoration(
          //     labelText: 'Phone Number',
          //     prefixIcon: Icon(
          //       Icons.phone,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          TextField(
            onChanged: (value) => password = value,
            obscureText: true,
            decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(
                  Iconsax.password_check,
                ),
                suffixIcon: Icon(Iconsax.eye)),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                user = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  Get.offAll(const LoginPage());
                }
              },
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
