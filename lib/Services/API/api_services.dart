import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:parkinn/Modals/vehicle_modal.dart';
import 'package:parkinn/Services/API/api_decoding_methods.dart';
import 'package:parkinn/Services/API/api_paths.dart';
import 'package:parkinn/Services/global_controller.dart';

import '../../Modals/customer_modal.dart';

class API {
  static http.Client client = http.Client();
  static ApiPath apiPath = ApiPath();

  static Future<Customer?> createUser(String mobileNumber, String otp) async {
    try {
      Response response = await client.post(apiPath.createUser,
          body: {"mobileNumber": mobileNumber, "otp": otp});

      if (response.statusCode == 200) {
        log(name: "CREATE USER API:", "RESPONSE RECEIVED SUCCESSFULLY");

        return ApiDecoding.decodeCustomer(response);
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

  static Future<Customer?> loginUser(
      String mobileNumber, String customerId) async {
    try {
      Response response = await client.post(apiPath.loginUser,
          body: {"mobileNumber": mobileNumber, "customerId": customerId});

      if (response.statusCode == 200) {
        log(name: "LOGIN USER API", "USER LOGGED IN SUCCESSFULLY");

        return ApiDecoding.decodeCustomer(response);
      } else {
        log(name: "LOGIN USER API:", "RESPONSE FAILED: ${response.statusCode}");
        throw "Response failed ${response.statusCode}";
      }
    } on Exception catch (e) {
      log(name: "LOGIN USER API:", "EXCEPTION OCCURRED: $e ");
      throw "Something went wrong.";
    }
  }

  // todo anuroop: you will use this method to implement feature of adding vehicle
  static Future<Customer?> addVehicle({
    required String vehicleNumber,
    required String vehicleType,
  }) async {
    try {
      Response response = await client.post(apiPath.addVehicle, body: {
        // todo do check these field must not be null
        "mobileNumber": GlobalController.to.customer!.mobileNumber,
        "customerId": GlobalController.to.customer!.customerId,
        "vehicleNumber": vehicleNumber,
        "vehicleType": vehicleType
      });

      if (response.statusCode == 200) {
        log(name: "ADD VEHICLE API", "RESPONSE RECEIVED");

        return ApiDecoding.decodeCustomer(response);
      } else {
        throw "Response failed ${response.statusCode}";
      }
    } on Exception catch (e) {
      throw "Response failed";
    }
  }

  // todo daksh integrate create current transaction api and delete current transaction

  static Future<Customer> createTransaction(
      String vehicleType, String vehicleNumber) async {
    try {
      Response response = await client.post(apiPath.createTransaction, body: {
        "mobileNumber": GlobalController.to.customer!.mobileNumber,
        "customerId": GlobalController.to.customer!.customerId,
        "vehicleType": vehicleType,
        "vehicleNumber": vehicleNumber
      });

      if (response.statusCode == 200) {
        return ApiDecoding.decodeCustomer(response);
      } else {
        throw "Response failed ${response.statusCode}";
      }
    } on Exception catch (e) {
      throw "Response failed";
    }
  }

  static Future<Customer> deleteTransaction() async {
    try {
      Response response = await client.post(apiPath.deleteTransaction, body: {
        "mobileNumber": GlobalController.to.customer!.mobileNumber,
        "customerId": GlobalController.to.customer!.customerId
      });

      if (response.statusCode == 200) {
        return ApiDecoding.decodeCustomer(response);
      } else {
        throw "Response failed ${response.statusCode}";
      }
    } on Exception catch (e) {
      throw "Response failed";
    }
  }
}
