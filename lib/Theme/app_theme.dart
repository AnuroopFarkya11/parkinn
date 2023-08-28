import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/brand_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // useMaterial3: true,
    appBarTheme: AppBarTheme(
        backgroundColor: BrandColors.transparent,
        foregroundColor: BrandColors.black),
    textTheme: GoogleFonts.interTextTheme(),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith(
                (states) => BrandColors.brandBlack))),
    inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: BrandColors.black)),
        labelStyle: TextStyle(color: BrandColors.brandBlack, fontSize: 15)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: BrandColors.buttonBlack,
          disabledBackgroundColor: BrandColors.brandBlack,
          disabledForegroundColor: BrandColors.brandBlack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
    ),
    dividerColor: BrandColors.brandBlack,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: BrandColors.black),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade900);
}
