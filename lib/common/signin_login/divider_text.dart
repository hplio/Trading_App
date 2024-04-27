import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 60,
            endIndent: 5,
            color: dark ? TColor.darkGrey : TColor.grey,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 5,
            endIndent: 60,
            color: dark ? TColor.darkGrey : TColor.grey,
          ),
        ),
      ],
    );
  }
}
