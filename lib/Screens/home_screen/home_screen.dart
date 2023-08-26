import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import '../../Services/API/api_services.dart';
import '../../Services/global_controller.dart';
import '../../Utils/sizes.dart';
import '../../Widgets/app_bar/parkyn_bar.dart';
import '../../Widgets/form_textfield/formfield.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    log(name: "Home Screen", "${GlobalController.to.customer!.customerId}");
    // int selectedTileIndex = -1;

    return Scaffold(

      endDrawer: const ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          // physics: NeverScrollableScrollPhysics(),
          slivers: [

            ParkynBar(
              titleWidget:Text(
                "Select Vehicle",
                style: TextStyle(

                    fontSize: CustomSizes.height * 0.025),

              ), bottomWidget: Divider(height: 2,endIndent: 210,indent: 1,),



            ),
           /* ParkInBar(
                titleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Select Vehicle",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: CustomSizes.height * 0.025),

                    ),
                    Divider(color: Colors.black,height: 2,endIndent: 220,indent: 1,)
                  ],
                ),
              bottomWidget: Container(),
                ),*/
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: CustomSizes.width*0.01, vertical: 5),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey, width: 0.5),
                //     borderRadius: BorderRadius.circular(12)),
                constraints: BoxConstraints(maxHeight: 250, minHeight: 100),
                child: Obx(
                  () => controller.vehicleList.isEmpty
                      ? Center(
                          child: Text("No vehicles."),
                        )
                      : Obx(
                          () => Scrollbar(
                            controller: controller.scrollController,
                            thumbVisibility: true,
                            child: ListView.builder(

                              shrinkWrap: true,
                              itemCount:
                                  controller.customer.value.vehicles!.length,
                              reverse: true,
                              physics: const BouncingScrollPhysics(),
                              controller: controller.scrollController,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                              addAutomaticKeepAlives: true,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => ParkInnCard(
                                    isDeleted: controller.deleteTileIndex.value==index,
                                    vehicle: controller
                                        .customer.value.vehicles![index],
                                    isVehicleSelected:
                                        controller.selectedTileIndex.value ==
                                            index,
                                    onTap: () {
                                      // controller.vehicleIndex = index;
                                      log(
                                          name: "HOME SCREEN",
                                          "RES:${controller.selectedTileIndex.value = index}");
                                      controller.selectedTileIndex.value =
                                          index;
                                      controller.selectedTileIndex.refresh();
                                    },
                                    trailingOnTap: () =>
                                        controller.onDeleteTap(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ),
            ),

            /* SizedBox(
                  height: 20,
                  ),*/

            Obx(() {
              return SliverVisibility(
                  visible: controller.clickAdd.value,

                  // ADD VEHICLES
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /*  Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              constraints: BoxConstraints(
                                  maxHeight: 200, minHeight: 100),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.50),
                                  borderRadius: BorderRadius.circular(12)),
                              child: GlobalController
                                          .to.customer!.allVehicles!.length ==
                                      0
                                  ? Container(
                                      height: 100,
                                      child: Center(
                                        child: Text("No Vehicle added"),
                                      ),
                                    )
                                  : Scrollbar(
                                      thumbVisibility: true,
                                      // controller: ScrollController().po,
                                      // todo
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.allVehicleListLen.value,
                                        itemBuilder: (context, index) {
                                          return ParkInnCard(
                                              vehicle: controller
                                                  .allVehicleList[index],
                                              isVehicleSelected: index ==
                                                  controller
                                                      .selectedTileIndex.value,
                                              onTap: () {
                                                controller.selectedTileIndex
                                                    .value = index;
                                                log(
                                                    name: "Selected tile",
                                                    "Res:${controller.selectedTileIndex.value = index}");
                                              },
                                              trailingOnTap: () {
                                                log("Tapped");
                                              },);
                                        },
                                      ),
                                    )),*/
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Vehicle Details"),
                                SizedBox(
                                  height: 20,
                                ),
                                ParkInField(

                                    // todo key formatters in terms ki MP 09 CG 1124
                                    labelText: "Vehicle Number",
                                    formKey: controller.vNumKey,
                                    validator: controller.vehicleNumValidator,
                                    controller: controller.vNumController),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: CustomSizes.width*0.6,
                                  child: Form(
                                      key: controller.vTypeKey,
                                      child: DropdownButtonFormField(
                                          validator: controller.menuValidator,
                                          decoration: InputDecoration(
                                              labelText: "Vehicle Type"),
                                          // hint: Text("Vehicle Type"),
                                          alignment: Alignment.bottomCenter,
                                          items: <String>[
                                            "2 Wheeler",
                                            "4 Wheeler"
                                          ]
                                              .map<DropdownMenuItem<String>>(
                                                  (String type) =>
                                                      DropdownMenuItem<String>(
                                                        value: type,
                                                        child: Text(type),
                                                      ))
                                              .toList(),
                                          onChanged: controller.menuOnChanged)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => ElevatedButton(
                                          onPressed: controller.onAddPressed,
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                          child: controller.isAdding.value
                                              ? SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2.0),
                                                )
                                              : Text("Add", style: TextStyle(color: Colors.white),)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                      onPressed: controller.onCancelPressed,
                                      child: Text(
                                        "Cancel",
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // HOME SCREEN
                  replacementSliver: SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*  Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                borderRadius: BorderRadius.circular(12)),
                            constraints:
                                BoxConstraints(maxHeight: 250, minHeight: 100),
                            child: Obx(
                              () => controller.vehicleList.isEmpty
                                  ? Center(
                                      child: Text("No vehicles."),
                                    )
                                  : Obx(
                                      () => Scrollbar(
                                        controller: controller.scrollController,
                                        thumbVisibility: true,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .customer.value.vehicles!.length,
                                          reverse: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          controller:
                                              controller.scrollController,
                                          addAutomaticKeepAlives: true,
                                          itemBuilder: (context, index) {
                                            return Obx(
                                              () => ParkInnCard(
                                                vehicle: controller.customer
                                                    .value.vehicles![index],
                                                isVehicleSelected: controller
                                                        .selectedTileIndex
                                                        .value ==
                                                    index,
                                                onTap: () {
                                                  controller.vehicleIndex =
                                                      index;
                                                  log(
                                                      name: "HOME SCREEN",
                                                      "RES:${controller.selectedTileIndex.value = index}");
                                                  controller.selectedTileIndex
                                                      .value = index;
                                                  controller.selectedTileIndex
                                                      .refresh();
                                                },
                                                trailingOnTap: () => controller
                                                    .onDeleteTap(index),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),*/
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    controller.clickAdd.value = true;
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                  child: Text("New vehicle", style: TextStyle(color: Colors.white),)),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                  onPressed: controller.onProceedTap,
                                  child: controller.proceed.value
                                      ? SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3.0,
                                          ),
                                        )
                                      : Text("Proceed", style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            })

            /*       SliverFillRemaining(
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
            )*/
          ],
        ),
      ),
    );
  }
}

/*
*
*  SliverToBoxAdapter(
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
                         if (controller.allVehicleList.isEmpty) {
                           return Container(height: 100,
                             child: Center(child: Text("No Vehicle added"),),);
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
           ),*/
/*        SliverFillRemaining(
             hasScrollBody: false,
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

                     // todo key formatters in terms ki MP 09 CG 1124
                       labelText: "Vehicle Number",
                       formKey: controller.vNumKey,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "Please enter your vehicle number.";
                         }
                         return null;
                       },
                       controller: controller.vNumController),
                   SizedBox(
                     height: 20,
                   ),
                   Form(
                       // key: controller.vTypeKey,
                       child: DropdownButtonFormField(
                           validator: (String? value) {
                             if (value == null) {
                               return "Please choose vehicle type.";
                             }
                             return null;
                           },
                           decoration:
                           InputDecoration(labelText: "Vehicle Type"),
                           // hint: Text("Vehicle Type"),
                           alignment: Alignment.bottomCenter,
                           items: <String>["2 Wheeler", "4 Wheeler"]
                               .map<DropdownMenuItem<String>>(
                                   (String type) =>
                                   DropdownMenuItem<String>(
                                     value: type,
                                     child: Text(type),
                                   ))
                               .toList(),
                           onChanged: (String? type) {
                             // todo check a better way to access value
                             log(name: "ADD VEHICLE", "Vehicle type : $type");
                             controller.vType = type;
                           })),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     children: [
                       Obx(
                             ()=>ElevatedButton(
                             onPressed: () async {
                               */ /*Vehicle vehicle = Vehicle();
                                controller.allVehicleList.add(vehicle);
                                log("${controller.allVehicleList.length}");*/ /*


                               if (controller.vNumKey.currentState!.validate() &&
                                   controller.vTypeKey.currentState!
                                       .validate()) {
                                 log(name: "ADD VEHICLE", "Adding Vehicle");
                                 controller.isAdding.value = true;

                                 try {
                                   await API.addVehicle(
                                       vehicleNumber: controller.vNumController
                                           .text, vehicleType: controller.vType!)
                                       .then((value) {
                                     log(name:"ADD VEHICLE","${value.toString()}");
                                     controller.isAdding.value = false;
                                     controller.vNumController.clear();


                                     Get.snackbar("Vehicle Status", "Vehicle added successfully");


                                   });
                                 } catch (e) {
                                   log(name: "ADD VEHICLE", "EXCEPTION $e");
                                 }
                               }
                             },
                             child: controller.isAdding.value ? SizedBox(
                               height: 15,
                               width: 15,
                               child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0),) : Text(
                                 "Add")),
                       ),
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
*/
