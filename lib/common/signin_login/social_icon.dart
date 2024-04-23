import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.imgString,
    this.onTap,
  });

  final String imgString;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: dark ? TColor.lightGrey.withOpacity(.5) : TColor.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image(
            image: AssetImage(
              imgString,
            ),
          ),
        ),
      ),
    );
  }
}
