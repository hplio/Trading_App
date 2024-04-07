import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/constants/text.dart';
import 'package:trading_app/onbording_page/controllers/onbording_controller.dart';
import 'package:trading_app/onbording_page/widgets/dot_navigator.dart';
import 'package:trading_app/onbording_page/widgets/onbording_arrow.dart';
import 'package:trading_app/onbording_page/widgets/onbording_page_structure.dart';
import 'package:trading_app/constants/size.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBordingController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: KSizeScreen.getScreenHeight(context) * .03,
            left: KSizeScreen.getScreenHeight(context) * .025,
           child: const DotNavigator(),
          ),
          PageView(
            controller:controller.pageController,
            onPageChanged: (value) => controller.updatePageIndicator(value),
            children: const [
              OnBordingStructure(
                imgString: KtextString.onBrodingImg1,
                title: KtextString.onBordingTitle1,
                subTitle: KtextString.onBordingSubTitle1,
              ),
              OnBordingStructure(
                imgString: KtextString.onBrodingImg2,
                title: KtextString.onBordingTitle2,
                subTitle: KtextString.onBordingSubTitle2,
              ),
              OnBordingStructure(
                imgString: KtextString.onBrodingImg3,
                title: KtextString.onBordingTitle3,
                subTitle:KtextString.onBordingSubTitle3,
              ),
            ],
          ),
          Positioned(
            bottom: KSizeScreen.getScreenHeight(context) * .03,
            right: KSizeScreen.getScreenHeight(context) * .025,
            child: const OnBordingArrowNav(),
          ),
        ],
      ),
    );
  }
}
