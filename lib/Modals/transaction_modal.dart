
/*
*
*            TRANSACTION MODAL
*
*
* */
import 'package:parkinn/Modals/vehicle_modal.dart';

class Transaction {
  late String? transactionId;
  late Vehicle? vehicleData;
  // todo decode time
  late String? startTime;
  late String? endTime;
  late String? locationId;
  late int amount;
  late int? closingBalance;
  // todo accept it as date time
  late String? createDate;

  Transaction(
      {this.transactionId,
        this.vehicleData,
        this.startTime,
        this.endTime,
        this.locationId,
        this.amount = 0,
        this.closingBalance,
        this.createDate});
}
