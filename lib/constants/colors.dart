import 'package:flutter/material.dart';

class TColor {
  TColor._();
  static const Color primary = Color(0XFF4b68ff);
  static const Color secondery = Color(0XFFFFE24B);
  static const Color accent = Color(0XFFb0c7ff);

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSeconery = Color(0xFF6c757d);
  static const Color textWhite = Colors.white;

  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3f5ff);

  static const Color lightContainer = Color(0XFFF6F6F6);
  static Color darkContainer = TColor.textWhite.withOpacity(.1);

  static const Color buttonPrimary = Color(0XFF4b68ff);
  static const Color buttonSecoundry = Color(0XFF6c756d);
  static const Color buttonDisable = Color(0XFFc4c4c4);

  static const Color borderPrimary = Color(0XFFD9D9D9);
  static const Color borderSecondary = Color(0XFFe6e6e6);

  static const Color error = Color(0XFFd32f2f);
  static const Color success = Color(0XFF388e3c);
  static const Color warning = Color(0XFFf57c00);
  static const Color info = Color(0XFF1976d2);

  static const Color black = Color(0XFF232323);
  static const Color darkerGrey = Color(0XFF4f4f4f);
  static const Color darkGrey = Color(0XFF939393);
  static const Color grey = Color(0XFFe0e0e0);
  static const Color softGrey = Color(0XFFf4f4f4);
  static const Color lightGrey = Color(0XFFf9f9f9);
  static const Color white = Color(0XFFffffff);
}
