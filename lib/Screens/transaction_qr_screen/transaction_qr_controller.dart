import 'dart:developer';

import 'package:get/get.dart';
import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/Modals/transaction_modal.dart';
import 'package:parkinn/Services/global_controller.dart';

import '../../Services/API/api_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TransactionQrController extends GetxController {
  late Customer? customer;
  late Transaction currentTransaction;
  late RxBool change;

  @override
  void onInit() {
    super.onInit();
    try {
      customer = GlobalController.to.customer;
      currentTransaction = customer!.currentTransaction!;
      IO.Socket socket = IO.io('http://54.66.147.216:8080', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.onConnect((_) {
        log(name: "SOCKET CONNECTION", "SUCCESSFUL CONNECTION");
      });

      socket.emit('Credentials', {
        'customerId': customer!.customerId,
        'mobileNumber': customer!.mobileNumber
      });

      socket.on('ParkingStatus', (data) {

        //todo rebuild of widget parking time

        log(name: "SOCKET DATA", "$data");
      });

      socket.on(
        'disconnect',
        (data) {
          log(name: "SOCKET CONNECTION", "CONNECTION CLOSED $data");
        },
      );
    } on Exception catch (e) {
      // TODO
    }

    change = false.obs;
  }

  Future onChangePressed() async {
    change.value = true;
    try {
      await API.deleteTransaction();
      Get.snackbar("Transaction", "Current Transaction Deleted");
      Get.offAllNamed('homeScreen');
    } catch (e) {
      Get.snackbar("Transaction", "Failed to delete transaction");
    }
  }
}
