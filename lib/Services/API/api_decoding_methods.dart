import 'dart:convert';

import 'package:http/http.dart';

import '../../Modals/customer_modal.dart';
import '../../Modals/vehicle_modal.dart';

class ApiDecoding {
  static Customer decodeCustomer(Response response) {
    Map<dynamic, dynamic> customerData = json.decode(response.body);

    if (customerData.length == 2) {
      throw "Response failed";
    }

    return Customer(
        mobileNumber: customerData['mobileNumber'],
        customerId: customerData['customerId'],
        balance: customerData['balance'],
        currentTransaction: customerData['currentTransaction'],
        vehicles: decodeVehicleList(list: customerData['vehicles']),
        allVehicles: decodeVehicleList(list: customerData['allVehicles']),
        history: customerData['history'],
        createDate: customerData['createDate']);
  }

  static List<Vehicle> decodeVehicleList({required List<dynamic> list}) {
    List<Vehicle> vehicleList = list.map((tempVehicle) {
      return Vehicle(
          vehicleNumber: tempVehicle['vehicleNumber'],
          vehicleType: tempVehicle['vehicleType'],
          date: tempVehicle['createDate']);
    }).toList();

    return vehicleList;
  }
}
