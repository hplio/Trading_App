import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/bindings/general_bindings.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GenralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeDesinge.lightTheme,
      darkTheme: ThemeDesinge.darkTheme,
      home: const Scaffold(
        // body: OnBordingPage(),
        backgroundColor: TColor.primary,
        body:Center(
          child: CircularProgressIndicator(
            color: TColor.white,
          ),
        ) ,
      ),

    );
  }
}
