import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/transaction_qr_screen/transaction_qr_controller.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/app_bar/parkyn_bar.dart';
import 'package:parkinn/Widgets/bottom_bar/bottom_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

import '../../Services/API/api_services.dart';

class TransactionQr extends GetView<TransactionQrController> {
  const TransactionQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),
      // backgroundColor: Colors.white,
      body: CustomScrollView(
        // physics: NeverScrollableScrollPhysics(),
        slivers: [
          ParkynBar(
              titleWidget: Row(
                children: [
                  Text(
                    "Parkyn",
                    style: TextStyle(
                        color: BrandColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  Text(
                    "Tag",
                    style: TextStyle(color: Colors.black, fontSize: 35,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              expandedHeight: CustomSizes.height * 0.1,
              bottomWidget: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                tileColor: Colors.grey.shade300,
                title: Text(
                  controller.currentTransaction.vehicleData!.vehicleNumber!,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                ),
                subtitle: Text(
                  controller.currentTransaction.vehicleData!.vehicleType!,
                ),
                trailing: Obx(() {
                  if (controller.status.value == ParkingStatus.started) {
                    return Text("Parking Started");
                  } else {
                    return Obx(
                      () => TextButton(
                        onPressed: controller.onChangePressed,
                        style: TextButton.styleFrom(
                            backgroundColor: BrandColors.brandWhite,
                            foregroundColor: Colors.black),
                        child: controller.change.value
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Text("Change Vehicle"),
                      ),
                    );
                  }
                }),
              )),

          SliverToBoxAdapter(
            // hasScrollBody: false,
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(25),
                height: CustomSizes.height*0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: BrandColors.brandBlack)
                ),
                child: CachedNetworkImage(imageUrl:GlobalController
                    .to.customer!.currentTransaction!.parkingQr!,
                  fit: BoxFit.fill,
                  placeholder: (context,string)=>Center(child: CircularProgressIndicator()),
                  errorWidget: (context,string,_)=>Center(child: Text("Something went wrong")),
                )




            ),
          ),

          Obx(
            () => SliverVisibility(
              visible: controller.status.value == ParkingStatus.initial,
              sliver: SliverFillRemaining(
                // SCREEN 3
                hasScrollBody: false,
                // fillOverscroll: false,
                child: Center(
                  child: Text("Parking Time Not Started"),
                ),
              ),
              replacementSliver: SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Parking Started: ${controller.startTime}"
                      "\nLocation: ${controller.location}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (controller.endTime.isNotEmpty)
                      Text("Parking Ended:${controller.endTime}"),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Get.bottomSheet(Container(),
                              backgroundColor: Colors.white);
                        },
                        child: Text("View Bill"))
                  ],
                ),
              ),
            ),
          )

          // SliverToBoxAdapter(
          //   child: ListTile(
          //     tileColor: Colors.white60,
          //     title: Text(
          //       "Balance",
          //       style: TextStyle(
          //           fontSize: 13, color: BrandColors.subTitleColor),
          //     ),
          //     subtitle: Text(
          //       "Rs.400",
          //       style:
          //       TextStyle(fontSize: 20, color: BrandColors.brandBlack),
          //     ),
          //     trailing: ElevatedButton(
          //       onPressed: () {},
          //       child: Text("Recharge"),
          //     ),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

/*
*
* NetworkImage(
                              "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png"))
* */
