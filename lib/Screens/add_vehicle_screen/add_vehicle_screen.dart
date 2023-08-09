import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/add_vehicle_screen/add_vehicle_controller.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import 'package:parkinn/Widgets/form_textfield/formfield.dart';

import '../../Modals/vehicle_modal.dart';
import '../../Services/API/api_services.dart';

class AddVehicleScreen extends GetView<AddVehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),

      body: SafeArea(
        child: CustomScrollView(
          // physics: NeverScrollableScrollPhysics(),
          slivers: [
            ParkInBar(bottomWidget: Container(),),


          ],
        ),
      ),
    );
  }
}
