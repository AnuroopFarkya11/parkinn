import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';

import '../../Services/shared_preferences/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Map<String?, String?> user;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (SharedService.checkStatus() == true) {
          user = SharedService.getCustomerId()!;
          GlobalController.to.userID = user['customerId']!;
          GlobalController.to.userNumber = user['mobileNumber']!;
          Get.offNamed('/homeScreen');
        } else {
          Get.offNamed('/authScreen');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "ParkInn",
              style: TextStyle(
                  color: BrandColors.primaryColor,
                  fontSize: 55,
                  fontWeight: FontWeight.w500),
            ))
          ],
        ),
      ),
    );
  }
}
