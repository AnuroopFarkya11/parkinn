import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
class GlobalController extends GetxController{


  static GlobalController get to => Get.find();

  GlobalController(){
   log(name:"GLOBAL CONTROLLER","INITIALIZED");
  }


  Customer? customer;
  String? currentRoute;
  String companyName="Parkyn";
  // bool? currentTheme = SharedService.getThemeStatus();
}