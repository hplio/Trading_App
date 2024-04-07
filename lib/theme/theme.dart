import 'package:flutter/material.dart';
import 'text_theme.dart';
import 'elevated_button_theme.dart';
import 'appbar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'outlined_button_theme.dart';
import 'input_decoration_theme.dart';

class ThemeDesinge {
  ThemeDesinge._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevetedButtonTheme.lightElevetedButtonTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TInputDecorationTheme.lightInputDecotation,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevetedButtonTheme.darkElevetedButtonTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TInputDecorationTheme.darkInputDecotation,
  );
}
