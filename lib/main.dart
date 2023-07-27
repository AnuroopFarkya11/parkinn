import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_screen.dart';
import 'package:parkinn/Theme/app_theme.dart';



void main() {
  runApp(const ParkInn());
}
/*
*
*       "MAIN.DART" is the main file for this application.
*
* */

class ParkInn extends StatelessWidget {
  const ParkInn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ParkInn",
      theme: AppTheme.appTheme,
      home: AuthScreen(),

    );
  }
}










