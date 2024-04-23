import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'I agree to ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: 'Privacy Police',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColor.white : TColor.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColor.white : TColor.primary,
                ),
          ),
          TextSpan(
            text: ' and ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: 'Terms of use',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColor.white : TColor.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColor.white : TColor.primary,
                ),
          ),
        ],
      ),
    );
  }
}
