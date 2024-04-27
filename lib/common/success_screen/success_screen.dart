import 'package:flutter/material.dart';

class SuccsessScreen extends StatelessWidget {
  const SuccsessScreen(
      {super.key,
      required this.imageString,
      required this.title,
      required this.subTitle,
      this.onPress, this.imgHight, this.imgWidth, this.upperImgHight});

  final String imageString;
  final String title;
  final String subTitle;
  final void Function()? onPress;
  final double? imgHight;
  final double? upperImgHight;
  final double? imgWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 56,
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            children: [
              SizedBox(
                height: upperImgHight,
              ),
              Image(
                height:imgHight ,
                width: imgWidth,
                image: AssetImage(imageString,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPress,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
