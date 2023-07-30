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

class AddVehicleScreen extends GetView<AddVehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            ParkInBar(subTitle: "Add Vehicle"),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("All vehicles"),
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 200, minHeight: 100),
                      child: Obx(
                        () {
                          if(controller.allVehicleList.isEmpty)
                            {
                              return Container(height: 100,child: Center(child: Text("No Vehicle added"),),);
                            }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.allVehicleList.length,
                            itemBuilder: (context, index) {
                              return ParkInnCard("Ramji", "4 wheeler");
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vehicle Details"),
                    SizedBox(
                      height: 20,
                    ),
                    ParkInField(
                        labelText: "Vehicle Number",
                        formKey: controller.vNumKey,
                        controller: controller.vNumController),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: DropdownButtonFormField(
                            decoration:
                                InputDecoration(labelText: "Vehicle Type"),
                            // hint: Text("Vehicle Type"),
                            alignment: Alignment.bottomCenter,
                            items: <String>["2 Wheeler", "4 Wheeler"]
                                .map<DropdownMenuItem<String>>(
                                    (e) => DropdownMenuItem<String>(
                                          child: Text(e),
                                          value: e,
                                        ))
                                .toList(),
                            onChanged: (value) {})),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Vehicle vehicle = Vehicle();
                              controller.allVehicleList.add(vehicle);
                              log("${controller.allVehicleList.length}");
                            },
                            child: Text("Add")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
