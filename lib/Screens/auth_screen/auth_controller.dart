import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AuthController extends GetxController{
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  late Rx<bool> otpCheck;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    otpCheck = false.obs;
  }



}