import 'package:get/get.dart';
import 'package:flutter/material.dart';

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


}
