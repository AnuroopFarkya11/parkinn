import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parkinn/Modals/vehicle_modal.dart';
import 'package:parkinn/Services/global_controller.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/API/api_services.dart';

class HomeController extends GetxController {
  late RxList vehicleList;
  late RxInt vehicleListLen;
  late RxList allVehicleList;
  late RxInt allVehicleListLen;
  TextEditingController vNumController = TextEditingController();
  GlobalKey<FormState> vNumKey = GlobalKey<FormState>();
  GlobalKey<FormState> vTypeKey = GlobalKey<FormState>();

  late int vehicleIndex;
  late String? vType;
  late RxBool isAdding;
  late RxBool clickAdd;
  late RxBool proceed;
  late Rx selectedTileIndex;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    vehicleIndex = -1;
    vehicleList = GlobalController
        .to.customer!.vehicles!.obs;
    vehicleListLen = GlobalController
        .to.customer!.vehicles!.length.obs;

    allVehicleList = GlobalController.to.customer!.allVehicles!.obs;
    allVehicleListLen = GlobalController.to.customer!.allVehicles!.length.obs;
    isAdding = false.obs;
    clickAdd = false.obs;
    selectedTileIndex = 9999.obs;
    proceed = false.obs;
  }

  // HOME SCREEN

  bool validateVehicleIndex() {
    if (selectedTileIndex == 9999) {
      Get.snackbar("Transaction", "Please select a vehicle");
      return false;
    }
    return true;
  }

  void onProceedTap() async {
    // todo DAKSH add a circular progress indicator to this button



    if (validateVehicleIndex()) {
      // call create transaction api and navigate to transaction screen
      proceed.value = true;
      Vehicle vehicle =
          GlobalController.to.customer!.vehicles![selectedTileIndex.value];
      log(
          name: "Create Transaction",
          "Selected Vehicle Index $selectedTileIndex ");
      try {
        // todo add check for balance
        await API
            .createTransaction(vehicle.vehicleType!, vehicle.vehicleNumber!)
            .then((Customer value) {
              proceed.value = false;
          GlobalController.to.customer = value;
          Get.snackbar("Transaction", "Transaction Created Successfully");

          Get.toNamed('/transactionQr');
        });


      } catch (e) {
        // TODO
        Get.snackbar("Transaction", "Transaction Failed");

      }
    }
  }

// SCREEN 2

  String? vehicleNumValidator(value) {
    if (value!.isEmpty) {
      return "Please enter your vehicle number.";
    }
    return null;
  }

  String? menuValidator(String? value) {
    if (value == null) {
      return "Please choose vehicle type.";
    }
    return null;
  }

  void menuOnChanged(String? type) {
    // todo check a better way to access value
    log(name: "ADD VEHICLE", "Vehicle type : $type");
    vType = type;
  }

  void onAddPressed() async {
    if (vNumKey.currentState!.validate() && vTypeKey.currentState!.validate()) {
      log(name: "ADD VEHICLE", "Adding Vehicle");
      isAdding.value = true; // circular indicator

      try {
        await API
            .addVehicle(vehicleNumber: vNumController.text, vehicleType: vType!)
            .then((Customer? customer) {
          if (customer != null) {
            GlobalController.to.customer = customer;
            vNumController.clear();
            vehicleList.value = customer.vehicles!;
            vehicleList.refresh();
            vehicleListLen.refresh();


            Get.snackbar("Vehicle Status", "Vehicle added successfully");

            isAdding.value = false;
            clickAdd.value = false;
          } else {
            Get.snackbar("Vehicle Status", "Something ");
          }
        });
      } catch (e) {
        log(name: "ADD VEHICLE", "EXCEPTION $e");
      }
    }
  }

  void onCancelPressed() {
    clickAdd.value = false;
  }
}
