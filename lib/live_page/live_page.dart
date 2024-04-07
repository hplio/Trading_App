import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark= Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                KtextString.homeAppBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color:dark? TColor.grey:TColor.darkerGrey),
              ),
              Text(
                KtextString.homeAppBarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color:dark? TColor.white:TColor.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text('Live page!!',
              style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
