import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:parkinn/Modals/vehicle_modal.dart';
import 'package:parkinn/Services/API/api_paths.dart';

import '../../Modals/customer_modal.dart';

class API {
  static http.Client client = http.Client();
  static ApiPath apiPath= ApiPath();

  static Future<Customer> createUser(String mobileNumber, String otp) async {


    try {
      Response response = await client
          .post(apiPath.createUser, body: {"mobileNumber": mobileNumber, "otp": otp});

      if (response.statusCode == 200) {
        log(name: "CREATE USER API:", "RESPONSE RECEIVED SUCCESSFULLY");

        return decodeCustomer(response);

      } else {
        log(
            name: "CREATE USER API: ",
            "RESPONSE FAILED: ${response.statusCode}");

        throw "Something went wrong:${response.statusCode}";
      }
    } on Exception catch (e) {
      log(name: "CREATE USER API:", "EXCEPTION OCCURRED: $e");
      throw "Something went wrong.";
    }
  }






  //                 decoding methods
  static List<Vehicle> decodeVehicleList({required List<dynamic> list}) {
    List<Vehicle> vehicleList = list.map((tempVehicle) {
      return Vehicle(
          vehicleNumber: tempVehicle['vehicleNumber'],
          vehicleType: tempVehicle['vehicleType'],
          date: tempVehicle['createDate']);
    }).toList();

    return vehicleList;
  }

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
}
