import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';

class SetHomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }



}