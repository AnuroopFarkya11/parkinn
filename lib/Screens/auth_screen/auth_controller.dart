import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/API/api_services.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  FocusNode numberFocus = FocusNode();

  late Rx<bool> otpCheck;
  late Rx<bool> isLoading;


  @override
  void onInit() {
    super.onInit();
    otpCheck = false.obs;
    isLoading = false.obs;
  }

  String? onNumberValidator(String? p0) {
    if (p0!.isEmpty) {
      return "Please enter a mobile number";
    }
    if (p0.isNotEmpty && p0.length < 10 && p0.length>10) {
      return "Please enter a valid number";
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

  Future onVerifyOtp () async {
    if(otpKey.currentState!.validate())
    {
      isLoading.value = true;

      try {
        await API
            .createUser(numberController.text, otpController.text)
            .then((Customer customer) {
          log(
              name: "AUTH SCREEN",
              "CUSTOMER RECEIVED: ${customer.mobileNumber} ${customer.customerId}");
          Get.offAllNamed('/homeScreen');
        });
      } on Exception catch (e) {
        // TODO
      }
    }
  }
}
