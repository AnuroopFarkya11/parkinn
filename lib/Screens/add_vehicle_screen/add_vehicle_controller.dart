import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddVehicleController extends GetxController{

  late RxList allVehicleList;
  // TextEditingController vNumController = TextEditingController();
  // GlobalKey<FormState> vNumKey = GlobalKey<FormState>();
  // GlobalKey<FormState> vTypeKey = GlobalKey<FormState>();




  late String? vType;
  late RxBool isAdding;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allVehicleList = [].obs;
    isAdding = false.obs;
  }
}