import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import 'package:parkinn/routes/route_name.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/API/api_services.dart';
import '../../Services/shared_preferences/shared_preference.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  FocusNode numberFocus = FocusNode();

  late Rx<bool> otpCheck;
  late Rx<bool> isLoading;
  Customer? customer;

  @override
  void onInit() {
    super.onInit();
    GlobalController.to.currentRoute=ParkYnRoute.authScreen;
    otpCheck = false.obs;
    isLoading = false.obs;
  }

  String? onNumberValidator(String? p0) {
    if (p0!.isEmpty) {
      return "Please enter a mobile number";
    }
    if (p0.isNotEmpty && p0.length < 10 && p0.length > 10) {
      return "Please enter a valid number";
    }

    return null;
  }

  String? onOtpValidation(String? otp) {
    if (otp!.isEmpty) {
      return "Please enter your otp";
    }
    if (otp.length < 5 || otp.length > 5) {
      return "Please enter a valid OTP.";
    }
    return null;
  }

  void onGetOtp() {
    if (numberKey.currentState!.validate()) {
      // TODO API FOR OTP WILL BE CALLED HERE
      //TODO ON CHANGE FOCUS ONCE OTP SENT
      otpCheck.value = true;
      Future.delayed(const Duration(milliseconds: 5), () {
        numberFocus.nextFocus();
      });
    }
  }

  Future onVerifyOtp() async {
    //TODO:Error handling now done by anuroop

    if (otpKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        customer = await API
            .createUser(numberController.text, otpController.text)
            .then(
          (customer) {
            SharedService.setCustomerId(
                customer!.mobileNumber!, customer.customerId!);

            GlobalController.to.customer = customer;

            SharedService.setStatus(status: true);

            Get.offAllNamed('/homeScreen');
          },
        );
      } on Exception catch (e) {
        // TODO Anuroop ERror handling will be done
        log(name: "AUTH SCREEN", "$e");
      }
    }
  }
}
