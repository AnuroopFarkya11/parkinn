import 'package:get/get.dart';
import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/routes/route_name.dart';

import '../../Modals/transaction_modal.dart';
import '../../Services/global_controller.dart';




//TODO API SERVICES PR KAAM KRNA PDEGA ISKE LIYE
class HistoryController extends GetxController{
  late Customer? customer;
  late List<Transaction?>? history;

  @override
  void onInit() {

    super.onInit();
    customer = GlobalController.to.customer;
    history = customer?.history;
    GlobalController.to.currentRoute= ParkYnRoute.historyScreen;
  }

}