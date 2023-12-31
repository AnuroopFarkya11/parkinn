import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parkinn/Services/API/api_services.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import 'package:parkinn/routes/route_name.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/shared_preferences/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Map<String?, String?>? user;

  // late Future<Customer?> customer;

  @override
  void initState() {
    super.initState();
    GlobalController.to.currentRoute = ParkYnRoute.splashScreen;
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (SharedService.checkStatus() == true) {
          user = SharedService.getCustomerId();
          if (user!.isNotEmpty) {
            String userID = user!['customerId']!;
            String userNumber = user!['mobileNumber']!;
            try {
              GlobalController.to.customer =
                  await API.loginUser(userNumber, userID);
              log(
                  name: "HISTORY",
                  "${GlobalController.to.customer!.history!.map((e) => e!.transactionId)}");
              if (GlobalController.to.customer!.currentTransaction == null) {
                Get.offNamed('/homeScreen');
              } else {
                Get.offNamed('/transactionQr');
              }
            } on Exception catch (e) {
              // TODO
            }
          }
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
