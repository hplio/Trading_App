import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();
  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        elevation: 0,
        side: const BorderSide(color: Colors.blue),
        textStyle: const TextStyle(
            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0)),
  );

  
  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
        side: const BorderSide(color: Colors.blueAccent),
        textStyle: const TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0)),
  );
}
