import 'package:get/get.dart';
import 'package:parkinn/Modals/vehicle_modal.dart';

class HomeController extends GetxController{

  late RxList allVehicleList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allVehicleList = [].obs;
  }


}