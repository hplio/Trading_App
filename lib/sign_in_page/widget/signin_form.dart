import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'User Name',
              prefixIcon: Icon(
                Iconsax.user,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(
                Icons.mail,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const TextField(
            decoration: InputDecoration(
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
              onPressed: () {},
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
