import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Services/API/api_services.dart';

class HomeController extends GetxController{

  late RxList allVehicleList;
  TextEditingController vNumController = TextEditingController();
  GlobalKey<FormState> vNumKey = GlobalKey<FormState>();
  GlobalKey<FormState> vTypeKey = GlobalKey<FormState>();

  late String? vType;
  late RxBool isAdding;
  late RxBool clickAdd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allVehicleList = [].obs;
    isAdding = false.obs;
    clickAdd = false.obs;
  }



// SCREEN 2

  String? vehicleNumValidator(value){
    if (value!.isEmpty) {
      return "Please enter your vehicle number.";
    }
    return null;
  }

  String? menuValidator(String? value){
    if (value == null) {
      return "Please choose vehicle type.";
    }
    return null;
  }

  void menuOnChanged(String? type){
    // todo check a better way to access value
    log(name: "ADD VEHICLE", "Vehicle type : $type");
    vType = type;
  }

  void onAddPressed () async {



    if (vNumKey.currentState!.validate() &&
        vTypeKey.currentState!
            .validate()) {
      log(name: "ADD VEHICLE", "Adding Vehicle");
      isAdding.value = true;// circular indicator

      try {
        await API.addVehicle(
            vehicleNumber: vNumController
                .text, vehicleType:vType!)
            .then((value) {
          log(name:"ADD VEHICLE","${value.toString()}");
          isAdding.value = false;
          vNumController.clear();

          Get.snackbar("Vehicle Status", "Vehicle added successfully");


        });
      } catch (e) {
        log(name: "ADD VEHICLE", "EXCEPTION $e");
      }
    }
  }

  void onCancelPressed(){}

}
