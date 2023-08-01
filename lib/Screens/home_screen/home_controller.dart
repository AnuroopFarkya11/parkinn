import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{

  late RxList allVehicleList;
  TextEditingController vNumController = TextEditingController();
  GlobalKey<FormState> vNumKey = GlobalKey<FormState>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allVehicleList = [].obs;
  }


}