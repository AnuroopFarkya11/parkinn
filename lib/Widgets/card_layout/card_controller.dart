import 'package:get/get.dart';

class CardController extends GetxController{
  late Rx<bool> isSelected;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSelected = false.obs;
  }
 }