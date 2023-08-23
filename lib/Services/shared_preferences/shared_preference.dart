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
    return customerCredential;
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
      status = shared!.getBool("logStatus");
      log(name: "SHARED SERVICE", "lOG STATUS : $status");
    } on Exception catch (e) {
      log(name: "SHARED SERVICE", "LOG STATUS FAILED $e");
    }

    return status;
  }
  static void setThemeStatus({required bool status})
  {
    // true means light
    // false means dark
    try {
      log(name: "SHARED SERVICE", "Theme Status : $status");
      shared!.setBool("appTheme", status);
    } on Exception catch (e) {
      // TODO
      log(name: "SHARED SERVICE", "LOG STATUS FAILED $e");
    }

  }



  static bool? getThemeStatus()
  {
    bool? themeStatus;


    try {
      themeStatus = shared!.getBool("appTheme");
      log(name: "ThemeGet Status","Status: $themeStatus");


    } on Exception catch (e) {
      log(name: "ThemeGet Status","Exception: $e");
    }

    return themeStatus;


  }
}
