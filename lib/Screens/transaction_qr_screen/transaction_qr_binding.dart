import 'package:get/get.dart';
import 'package:parkinn/Screens/transaction_qr_screen/transaction_qr_controller.dart';

class SetTransactionQr extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionQrController());
  }

}