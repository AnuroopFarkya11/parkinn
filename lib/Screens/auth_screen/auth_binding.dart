import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
class SetAuthBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());

  }

}