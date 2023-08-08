
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/app_bar/new_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

import '../../Modals/vehicle_modal.dart';
import '../../Utils/sizes.dart';
import '../../Utils/text_styles.dart';
import '../../Widgets/form_textfield/formfield.dart';

class HomeScreen extends GetView<HomeController> {
  /*
  * todo : daksh
  *
  *
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          // physics: NeverScrollableScrollPhysics(),
          slivers: [
            
            ParkInBar(bottomWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Vehicle",style: TextStyle(
                    color: BrandColors.subTitleColor,
                    fontSize: CustomSizes.height * 0.06 * 0.5),),
              ],
            )),
            
            // const ParkInBar(
            //   // actionCheck: true,
            //   subTitle: "Select vehicle",
            // ),

            /* SliverFixedExtentList(delegate: SliverChildBuilderDelegate(childCount: 12,(context,cnt){

              return ParkInnCard("MP 09 DA 1107", "2 wheeler");

            }), itemExtent: 100)*/
            true?SliverFillRemaining(
              // hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ParkInnCard("MP 09 DA 1107", "2 wheeler");
                          },
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {Get.toNamed('/addScreen');}, child: Text("New vehicle")),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Proceed")),
                          ],
                        )
                      ],
                    )),
                    Container(
                      // height: 60,
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Balance",
                                  style: TextStyle(
                                      color: BrandColors.subTitleColor,
                                      fontWeight: FontWeight.bold)),
                              Text("Rs 300",
                                  style: TextStyle(
                                      color: BrandColors.brandBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Recharge",
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ):const SliverToBoxAdapter(),

            true?SliverToBoxAdapter(
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
            ):const SliverToBoxAdapter(),
            true?SliverFillRemaining(
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
            ):const SliverToBoxAdapter()
          ],
        ),
      ),
    );
  }
}
