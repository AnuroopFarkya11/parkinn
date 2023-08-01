import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/history_screen/history_controller.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';

class History extends GetView<HistoryController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ParkInBar(subTitle: "History")
        ],
      ),
    );
  }

}