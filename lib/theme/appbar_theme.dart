import 'package:flutter/material.dart';

class TAppbarTheme {
  TAppbarTheme._();
  static AppBarTheme lightAppbarTheme = const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 24.0),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 24.0),
      titleTextStyle: TextStyle(
          fontSize: 18.0, 
          fontWeight: FontWeight.w600, 
          color: Colors.black,
          ),
          );


  static AppBarTheme darkAppbarTheme = const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 24.0),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 24.0),
      titleTextStyle: TextStyle(
          fontSize: 18.0, 
          fontWeight: FontWeight.w600, 
          color: Colors.white,
          ),
          );
}
