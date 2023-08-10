import 'package:get/get.dart';
import 'package:parkinn/Screens/profile_screen/profile_controller.dart';

class SetProfileBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => ProfileController());
  }

}