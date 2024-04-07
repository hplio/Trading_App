import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/onbording_page/controllers/onbording_controller.dart';

class DotNavigator extends StatelessWidget {
  const DotNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = OnBordingController.instance;
    return SmoothPageIndicator(
      effect: WormEffect(
        type: WormType.thin,
        activeDotColor: dark ? TColor.primary : TColor.dark,
        dotHeight: 10,
      ),
      controller: controller.pageController,
      onDotClicked:controller.dotNavigationClick,
      count: 3,
    );
  }
}
