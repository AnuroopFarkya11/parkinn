import 'package:get/get.dart';
import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/Modals/transaction_modal.dart';
import 'package:parkinn/Services/global_controller.dart';

import '../../Services/API/api_services.dart';

class TransactionQrController extends GetxController{

  late Customer? customer;
  late Transaction currentTransaction;
  late RxBool change;

  @override
  void onInit() {
    super.onInit();
    customer = GlobalController.to.customer;
    currentTransaction = customer!.currentTransaction!;


    change = false.obs;
  }

  Future onChangePressed () async{
    change.value = true;
    try {
      await API.deleteTransaction();
      Get.snackbar("Transaction", "Current Transaction Deleted");
      Get.offAllNamed('homeScreen');


    }catch (e) {
      Get.snackbar("Transaction", "Failed to delete transaction");
    }

  }

}