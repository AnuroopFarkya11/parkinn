import 'package:flutter/material.dart';
class ApiPath{
  static String defaultUrl = "https://aquamarine-turkey-gear.cyclic.cloud";

  final Uri createUser = Uri.parse("$defaultUrl/api/customer");
  final Uri addVehicle = Uri.parse("$defaultUrl/api/vehicle/add");
  final Uri loginUser = Uri.parse("$defaultUrl/api/customer");
  final Uri createTransaction = Uri.parse("$defaultUrl/api/transaction/create");
  final Uri deleteTransaction = Uri.parse("$defaultUrl/api/transaction/delete");
}