import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:parkinn/Modals/vehicle_modal.dart';

import '../../Modals/customer_modal.dart';

class API {
  static http.Client client = http.Client();

  static const defaultUrl = "https://aquamarine-turkey-gear.cyclic.cloud";

  static Future<Customer> createUser(String mobileNumber, String otp) async {
    Uri url = Uri.parse("$defaultUrl/api/customer");
    log(url.toString());

    try {
      Response response = await client
          .post(url, body: {"mobileNumber": mobileNumber, "otp": otp});

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
    Map<dynamic, dynamic> data = json.decode(response.body);

    if (data.length == 2) {
      throw "Response failed";
    }

    return Customer(
        mobileNumber: data['mobileNumber'],
        customerId: data['customerId'],
        balance: data['balance'],
        currentTransaction: data['currentTransaction'],
        vehicles: decodeVehicleList(list: data['vehicles']),
        allVehicles: decodeVehicleList(list: data['allVehicles']),
        history: data['history'],
        createDate: data['createDate']);
  }
}
