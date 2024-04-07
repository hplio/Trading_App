import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = const TextTheme().copyWith(
    bodyLarge: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5),
    ),
    bodyMedium: const TextStyle(
      fontSize: 14.0,
      fontFamily: 'poppins',
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    headlineLarge: const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    titleLarge: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    labelLarge: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'poppins',
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'poppins',
      color: Colors.black.withOpacity(0.5),
    ),
  );
  static TextTheme darkTextTheme = const TextTheme().copyWith(
    bodyLarge: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Colors.white.withOpacity(0.5),
    ),
    bodyMedium: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 32.0,
      fontFamily: 'poppins',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    titleLarge: const TextStyle(
      fontSize: 16.0,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    titleSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    labelLarge: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'poppins',
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'poppins',
      color: Colors.white.withOpacity(0.5),
    ),
  );
}
