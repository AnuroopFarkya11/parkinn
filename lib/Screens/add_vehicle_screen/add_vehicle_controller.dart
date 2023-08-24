import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import 'package:parkinn/routes/route_name.dart';

import '../../Services/global_controller.dart';

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
    GlobalController.to.currentRoute = ParkYnRoute.addVehicleScreen;
    allVehicleList = [].obs;
    isAdding = false.obs;
  }
}