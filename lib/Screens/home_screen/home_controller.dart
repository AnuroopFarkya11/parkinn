import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parkinn/Modals/vehicle_modal.dart';
import 'package:parkinn/Services/global_controller.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/API/api_services.dart';

class HomeController extends GetxController {
  late Rx<Customer> customer;
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

  ScrollController scrollController=ScrollController();


  @override
  void onInit() {
    super.onInit();
    // TODO CHECK FOR EMPTY CUSTOMER
    customer = GlobalController.to.customer!.obs;
    vehicleIndex = -1;
    vehicleList = customer.value.vehicles!.obs;
    vehicleListLen = customer.value.vehicles!.length.obs;

    allVehicleList = customer.value.allVehicles!.obs;
    allVehicleListLen = customer.value.allVehicles!.length.obs;

    isAdding = false.obs;
    clickAdd = false.obs;
    selectedTileIndex = 9999.obs;
    proceed = false.obs;
    scrollToTop();
  }


  void scrollToTop(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  // HOME SCREEN

  bool validateVehicleIndex() {
    if (selectedTileIndex == 9999) {
      Get.snackbar("Transaction", "Please select a vehicle",snackPosition: SnackPosition.BOTTOM);
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
          GlobalController.to.customer = value;
          Get.snackbar("Transaction", "Transaction Created Successfully",snackPosition: SnackPosition.BOTTOM);

          Get.toNamed('/transactionQr');
        });


      } catch (e) {
        // TODO
        Get.snackbar("Transaction", "Transaction Failed",snackPosition: SnackPosition.BOTTOM);

      }

    }
    proceed.value = false;

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
            .then((Customer? value) {
          if (value != null) {
            GlobalController.to.customer = value;
            customer.value=value;
            vNumController.clear();




            selectedTileIndex.value=customer.value.vehicles!.length-1;
            // customer.reactive;
            // vehicleList.reactive;
            // vehicleListLen.reactive;
            // customer.refresh();
            // vehicleList.refresh();
            // vehicleListLen.refresh();
            // TODO THINK OF AN OPTIMIZE SOLN
            // vehicleList.value = customer.value.vehicles!;
            // vehicleListLen.value = customer.value.vehicles!.length;


            Get.snackbar("Vehicle Status", "Vehicle added successfully",snackPosition: SnackPosition.BOTTOM);

            isAdding.value = false;
            clickAdd.value = false;
            scrollToTop();

          } else {
            Get.snackbar("Vehicle Status", "Something Went Wrong",snackPosition: SnackPosition.BOTTOM);
          }

        });
      } catch (e) {
        log(name: "ADD VEHICLE", "EXCEPTION $e");
      }
    }
  }

  void onCancelPressed() {

    // Future.delayed(Duration(seconds: 1),(){
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     scrollController.jumpTo(scrollController.position.maxScrollExtent);});
    // });
    scrollToTop();
    clickAdd.value = false;

  }
}
