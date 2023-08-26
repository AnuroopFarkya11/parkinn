import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parkinn/Modals/vehicle_modal.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/snack_bar/snack_bar.dart';

import '../../Modals/customer_modal.dart';
import '../../Services/API/api_services.dart';
import '../../Widgets/drawer/app_drawer.dart';
import '../../routes/route_name.dart';

class HomeController extends GetxController {
  //late Rx<ParkInnCard> parkInnCard;
  late RxBool deleteTap;
  late Rx<Customer> customer;
  late RxList vehicleList;
  late RxInt vehicleListLen;
  late RxList allVehicleList;
  late RxInt allVehicleListLen;
  TextEditingController vNumController = TextEditingController();
  GlobalKey<FormState> vNumKey = GlobalKey<FormState>();
  GlobalKey<FormState> vTypeKey = GlobalKey<FormState>();

  final RegExp _vehicleNumberRegExp =
  RegExp(r'^[A-Z]{2}\s?[0-9]{1,2}\s?(?:[A-Z])?\s?(?:[A-Z]*)?\s?[0-9]{4}$');

  late int vehicleIndex;
  late String? vType;
  late RxBool isAdding;
  late RxBool clickAdd;
  late RxBool proceed;
  late Rx selectedTileIndex;
  late Rx deleteTileIndex;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    GlobalController.to.currentRoute=ParkYnRoute.homeScreen;
    log(name:"Current Route",GlobalController.to.currentRoute!);
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
    deleteTap = false.obs;
    deleteTileIndex = 9999.obs;
    scrollToTop();
  }

  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      log(name: "Scroll Controller","${scrollController.hasClients}");
      scrollController.hasClients?scrollController.jumpTo(scrollController.position.maxScrollExtent) :null;
    });
  }

  // HOME SCREEN

  bool validateVehicleIndex() {
    if (selectedTileIndex == 9999) {
      ParkynSnackBar("Transaction", "Please select a vehicle",);
      return false;
    }
    return true;
  }

  void onProceedTap() async {
    // todo DAKSH add a circular progress indicator to this button

    if (vehicleListLen == 0) {
      ParkynSnackBar("Vehicles Status", "No vehicles added");
    } else if (validateVehicleIndex()) {
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
          ParkynSnackBar("Transaction", "Transaction Created Successfully");
          proceed.value = false;

          Get.offNamed('/transactionQr');
        });
      } catch (e) {
        // TODO
        ParkynSnackBar("Transaction", "Transaction Failed");

      }
    }
    proceed.value = false;
  }

  Future<void> onDeleteTap(int index) async {
    //  parkInnCard.value.deleteTap.value = true;
    // deleteTileIndex.value = index;
    // deleteTap.value = true;
    Vehicle tempVehicle = customer.value.vehicles![index];
    log(name: "DELETE VEHICLE", "DELETING VEHICLE: $index");

    try {
      await API.removeVehicle(tempVehicle).then((value) {
        GlobalController.to.customer = value;
        customer.value = value!;
        vehicleList.value = customer.value.vehicles!;
        deleteTap.value = false;
      });

      ParkynSnackBar("Vehicle Deleted Successfully", "${tempVehicle.vehicleNumber}");


    } on Exception catch (e) {
      ParkynSnackBar("Vehicle Deleted Failed", "Something went wrong");
      deleteTileIndex.value=9999;
    }
  }

// SCREEN 2

  String? vehicleNumValidator(value) {
    bool isValid = _vehicleNumberRegExp.hasMatch(value);
    if (!isValid) {
      return "Please enter correct vehicle number";
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
            customer.value = value;
            vNumController.clear();
            vehicleList.value = customer.value.vehicles!;
            vehicleListLen.value = customer.value.vehicles!.length;
            selectedTileIndex.value = customer.value.vehicles!.length - 1;
            deleteTileIndex.value =  9999;
            // customer.reactive;
            // vehicleList.reactive;
            // vehicleListLen.reactive;
            // customer.refresh();
            // vehicleList.refresh();
            // vehicleListLen.refresh();
            // TODO THINK OF AN OPTIMIZE SOLN
            // vehicleList.value = customer.value.vehicles!;
            // vehicleListLen.value = customer.value.vehicles!.length;



            ParkynSnackBar("Vehicle Status", "Vehicle added successfully");

            isAdding.value = false;
            clickAdd.value = false;
            scrollToTop();
          } else {
            ParkynSnackBar("Vehicle Status", "Something Went Wrong");
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
