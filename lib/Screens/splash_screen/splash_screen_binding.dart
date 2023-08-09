import 'package:get/get.dart';
import 'package:parkinn/Screens/splash_screen/splash_screen_controller.dart';

class SetSplashBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => SplashController());
  }

}