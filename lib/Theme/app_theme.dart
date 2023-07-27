import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{

  static ThemeData appTheme = ThemeData(

    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: Color(0xff53D5C6),fontWeight: FontWeight.w800,fontSize: 50)


    )
  );
}