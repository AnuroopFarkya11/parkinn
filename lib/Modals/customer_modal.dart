
import 'package:parkinn/Modals/transaction_modal.dart';
import 'package:parkinn/Modals/vehicle_modal.dart';

class Customer {
  String? mobileNumber;
  String? customerId;
  int? balance;
  // List<dynamic> vehicles = [];
  List<Vehicle>? vehicles = [];
  // List<dynamic> allVehicles = [];
  List<Vehicle>? allVehicles = [];
  List<Transaction?>? history;
  // todo convert this transaction type
  Transaction? currentTransaction;
  // String? createDate;
  DateTime? createDate;



  Customer({
    this.mobileNumber,
    this.customerId,
    this.balance,
    this.currentTransaction,
    this.vehicles,
    this.allVehicles,
    this.history,
    this.createDate,
  });
}
