// ignore_for_file: unnecessary_getters_setters

import 'package:parkinn/Modals/vehicle_modal.dart';

/*
*
*            TRANSACTION MODAL
*
*
* */
class Transaction {
  late String _transactionId;
  late Vehicle _vehicleData;
  late DateTime _startTime;
  late DateTime _endTime;
  late String _locationId;
  late int _amount;
  late int _closingBalance;
  late DateTime _createDate;

  set transactionId(String value) {
    _transactionId = value;
  }

  set vehicleData(Vehicle value) {
    _vehicleData = value;
  }

  set startTime(DateTime value) {
    _startTime = value;
  }

  set endTime(DateTime value) {
    _endTime = value;
  }

  set locationId(String value) {
    _locationId = value;
  }

  set amount(int value) {
    _amount = value;
  }

  set closingBalance(int value) {
    _closingBalance = value;
  }

  set createDate(DateTime value) {
    _createDate = value;
  }

  String get transactionId => _transactionId;

  Vehicle get vehicleData => _vehicleData;

  DateTime get startTime => _startTime;

  DateTime get endTime => _endTime;

  String get locationId => _locationId;

  int get amount => _amount;

  int get closingBalance => _closingBalance;

  DateTime get createDate => _createDate;

  toJSON() {
    return {
      "transactionId": _transactionId,
      "vehicleData": _vehicleData,
      "startTime": _startTime,
      "endTime": _endTime,
      "locationId": _locationId,
      "amount": amount,
      "closingBalance": _closingBalance,
      "createDate": _createDate
    };
  }
}
