import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/brand_color.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    /*  appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Color(0xff53D5C6),
            fontWeight: FontWeight.w800,
            fontSize: 20),
      ),*/
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: BrandColors.primaryColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: BrandColors.primaryColor, width: 2)),
          labelStyle: TextStyle(color: BrandColors.brandBlack, fontSize: 15)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: BrandColors.primaryColor)
    )



  );
}
