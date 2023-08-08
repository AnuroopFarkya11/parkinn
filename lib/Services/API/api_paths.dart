import 'package:flutter/material.dart';
class ApiPath{
  static String defaultUrl = "https://aquamarine-turkey-gear.cyclic.cloud";

  final Uri createUser = Uri.parse("$defaultUrl/api/customer");
}