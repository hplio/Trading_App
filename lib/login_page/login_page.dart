import 'package:flutter/material.dart';
import 'package:trading_app/common/signin_login/divider_text.dart';
import 'package:trading_app/common/signin_login/social_icon.dart';
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
                const SizedBox(
                  height: 25,
                ),
                const DividerWithText(
                  text: 'or sign in with',
                ),
                const SizedBox(
                  height: 12,
                ),
                const Center(
                  child: SocialIcon(
                    imgString: 'Assets/images/logo/google.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

