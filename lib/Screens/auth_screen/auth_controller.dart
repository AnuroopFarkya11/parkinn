import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  FocusNode numberFocus = FocusNode();

  late Rx<bool> otpCheck;

  @override
  void onInit() {
    super.onInit();
    otpCheck = false.obs;
  }

  String? onNumberValidator(String? p0) {
    if (p0!.isEmpty) {
      return "Please enter a mobile number";
    }
    if (p0.length > 0 && p0.length < 10) {
      return "Please enter a valid number";
    }
    if (p0.length > 10) {
      return "Please enter a valid number";
    }
    return null;
  }

  void onTap() {
    if (numberKey.currentState!.validate()) {
      // TODO API FOR OTP WILL BE CALLED HERE
      //TODO ON CHANGE FOCUS ONCE OTP SENT
      otpCheck.value = true;
      Future.delayed(const Duration(milliseconds: 5), () {
        numberFocus.nextFocus();
      });

    }
  }
}
