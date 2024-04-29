import 'package:flutter/material.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/constants/text.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Privacy Policy',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: KtextString.privacyDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.heading}',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                        fontSizeDelta: 1,
                      ),
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.subHeading}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis2}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.subHeading1}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis3}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis4}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis5}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis6}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis7}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis8}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis9}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis10}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis11}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis12}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis13}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.privacyDis14}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.heading1}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.subHeading2}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis15}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.boltD}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.boltD1}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.boltD2}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.boltD3}\n',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextSpan(
                      text: '\n${KtextString.heading2}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: '\n${KtextString.privacyDis16}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const TextSpan(text: '\n'),
                    const TextSpan(text: '\n'),
                    buildBulletPoint(),
                    TextSpan(
                      text: '${KtextString.boltD4}\n',
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontSizeDelta: 1,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   WidgetSpan buildBulletPoint() {
    return const WidgetSpan(
      child: Padding(
        padding: EdgeInsets.only(right: 8.0), // Adjust spacing as needed
        child: Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

