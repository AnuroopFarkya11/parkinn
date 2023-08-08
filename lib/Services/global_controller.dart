import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
class GlobalController extends GetxController{


  static GlobalController get to => Get.find();



  GlobalController(){
   log(name:"GLOBAL CONTROLLER","INITIALIZED");
  }

  late final String userID;
  late final String userNumber;



}