import 'package:get/get.dart';
import 'package:parkinn/Screens/history_screen/history_controller.dart';

class SetHistoryBinding extends Bindings{


  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}