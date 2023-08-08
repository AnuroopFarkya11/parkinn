import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static SharedPreferences? shared;
  static String? customerId;
  static String? mobileNumber;

  static Future initializeSharedPreferences() async {
    log(name: "SHARED SERVICE", "SHARED_PREFERENCE INITIALED");

    try {
      shared = await SharedPreferences.getInstance();
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "EXCEPTION CAUSED: $e");
    }
  }

  static void setCustomerId(String mobileNumber, String customerId) {
    try {
      shared!.setString("customerId", customerId);
      shared!.setString("mobileNumber", mobileNumber);

      log(
          name: "SHARED SERVICE",
          "CUSTOMER ID AND NUMBER SET SUCCESS :  $mobileNumber $customerId");
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "CUSTOMER ID AND NUMBER SET FAILED");
    }
  }

  static Map<String?, String?>? getCustomerId() {
    Map<String?, String?>? customerCredential;
    try {
      customerId = shared!.getString("customerId");
      mobileNumber = shared!.getString("mobileNumber");

      customerCredential = {
        "customerId": customerId,
        "mobileNumber": mobileNumber,
      };

      log(
          name: "SHARED SERVICE",
          "USER DETAILS FETCHED SUCCESS $customerId $mobileNumber");
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "CUSTOMER IS FAILED $e");
    }
    return null;
  }

  static void setStatus({bool status = false}) {
    try {
      shared!.setBool("logStatus", status);
      log(name: "SHARED SERVICE", "STATUS SET : $status");
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "STATUS SET: FAILED $e");
    }
  }

  static bool? checkStatus() {
    bool? status = false;

    try {
      status = shared!.getBool('LogStatus');
      log(name: "SHARED SERVICE", "LOG STATUS : $status");
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "LOG STATUS FAILED $e");
    }

    return status;
  }
}
