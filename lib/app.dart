import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/onbording_page/onbording.dart';
import 'package:trading_app/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeDesinge.lightTheme,
      darkTheme: ThemeDesinge.darkTheme,
      home: const Scaffold(
        body: OnBordingPage(),
      ),

    );
  }
}
