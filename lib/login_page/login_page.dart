import 'package:flutter/material.dart';
import 'package:trading_app/constants/size.dart';
import 'package:trading_app/login_page/widget/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: KSizeScreen.getScreenHeight(context) * .05,
                ),
                Text(
                  'Welcome Back,',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Log In!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: KSizeScreen.getScreenHeight(context) * .05,
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

