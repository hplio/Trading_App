import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trading_app/constants/colors.dart';

class KAnimationLoader extends StatelessWidget {
  const KAnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              ),
              
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColor.textWhite : TColor.darkerGrey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: TColor.dark,
                    ),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
