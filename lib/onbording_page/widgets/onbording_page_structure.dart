import 'package:flutter/material.dart';
import 'package:trading_app/constants/size.dart';

class OnBordingStructure extends StatelessWidget {
  const OnBordingStructure({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgString,
  });

  final String title;
  final String subTitle;
  final String imgString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: KSizeScreen.getScreenHeight(context) * 0.6,
            width: KSizeScreen.getScreenWidth(context) * 0.8,
            image: AssetImage(
              imgString,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            softWrap: true,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
