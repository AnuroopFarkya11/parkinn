import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../Modals/customer_modal.dart';
import '../../Modals/transaction_modal.dart';
import '../../Modals/vehicle_modal.dart';

class ApiDecoding {

  static Customer decodeCustomer(Response response) {
    Map<dynamic, dynamic> data = json.decode(response.body);

    if (data.length == 2) {
      throw "Response failed";
    }

    return Customer(
        mobileNumber: data['mobileNumber'],
        customerId: data['customerId'],
        balance: data['balance'],
        currentTransaction:decodeTransaction(transaction: data["currentTransaction"]),
        vehicles: decodeVehicleList(list: data['vehicles']),
        allVehicles: decodeVehicleList(list: data['allVehicles']),
        history: null,
        createDate:decodeTime(time: data['createDate'])

    );
  }

  static Vehicle decodeVehicle({required vehicle}){
    return Vehicle(
        vehicleNumber: vehicle['vehicleNumber'],
        vehicleType: vehicle['vehicleType'],
        date: vehicle['createDate']);
  }

  static List<Vehicle> decodeVehicleList({required List<dynamic> list}) {
    List<Vehicle> vehicleList = list.map((tempVehicle) {
      return decodeVehicle(vehicle: tempVehicle);
    }).toList();

    return vehicleList;
  }

  static Transaction? decodeTransaction({required transaction}){
    if(transaction==null)
    {
      return null;
    }


    log(name:"DECODE TRANSACTION",transaction.toString());
    return Transaction(
        transactionId: transaction["transactionId"],
        vehicleData:decodeVehicle(vehicle: transaction["vehicle"]),
        startTime: transaction["startTime"],
        endTime: transaction["endTime"],
        locationId: transaction["locationId"],
        amount: transaction["amount"],
        closingBalance: transaction["closingBalance"],
        createDate: true?transaction["createDate"]:decodeTime(time: transaction["createDate"])

    );

  }

  static DateTime? decodeTime({required  time}){

    log(name:"DECODE DATE TIME","TTC TIME $time");
    DateTime utcTime = DateTime.parse(time);

    DateTime istTime = utcTime.add(const Duration(hours: 5,minutes: 30));

    String formattedIST = DateFormat('yyyy-MM-dd hh:mm:ss a').format(istTime);

    return istTime;

  }
}
