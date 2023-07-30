import 'package:get/get.dart';
import 'package:parkinn/Screens/add_vehicle_screen/add_vehicle_controller.dart';

class SetAddVehicleController extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => AddVehicleController());

  }

}