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
          ParkInBar(
              bottomWidget: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            tileColor: BrandColors.primaryColor,
            title: Text(
              controller.currentTransaction.vehicleData!.vehicleNumber!,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
            ),
            subtitle:
                Text(controller.currentTransaction.vehicleData!.vehicleType!),
            trailing: controller.startTime.length<2?Obx(
              () => TextButton(
                onPressed: controller.onChangePressed,
                child: controller.change.value
                    ? SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : Text("Change Vehicle"),
                style: TextButton.styleFrom(
                    backgroundColor: BrandColors.brandWhite,
                    foregroundColor: Colors.black),
              ),
            ):Text("Parking Started"),
          )),
          SliverToBoxAdapter(
            // hasScrollBody: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // CachedNetworkImage(imageUrl: controller.qrUrl),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: BrandColors.subTitleColor, width: 2),
                      ),
                      child: Image.network(
                            // todo get the qr url

                            GlobalController
                                .to.customer!.currentTransaction!.parkingQr!,
                            // "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png",
                            fit: BoxFit.fill,
                            height: CustomSizes.height * 0.4,
                          )),
                      /*
                    //   * Image.network(
                    //     // todo get the qr url
                    //
                    //     GlobalController
                    //         .to.customer!.currentTransaction!.parkingQr!,
                    //     // "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png",
                    //     fit: BoxFit.fill,
                    //     height: CustomSizes.height * 0.4,
                    //   )*/
                    // ),
                    // this will get hide when par
                    // Text("Parking time not started"),

                    // Text("Parking Time Started \n Location: Phoenix Parking",textAlign: TextAlign.center,)
                  ],
                ),
              ],
            ),
          ),

          Obx(
              ()=>  SliverVisibility(
                visible: controller.status.value==ParkingStatus.initial,
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
                        textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 20,),

                      if(controller.endTime.isNotEmpty)
                        Text("Parking Ended:${controller.endTime}"),


                      SizedBox(height: 20,),

                      OutlinedButton(onPressed: (){



                        Get.bottomSheet(Container(),backgroundColor: Colors.white);


                      }, child: Text("View Bill"))
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
      bottomNavigationBar: ListTile(
        tileColor: Colors.white60,
        title: Text(
          "Balance",
          style: TextStyle(fontSize: 13, color: BrandColors.subTitleColor),
        ),
        subtitle: Text(
          "Rs.400",
          style: TextStyle(fontSize: 20, color: BrandColors.brandBlack),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text("Recharge"),
        ),
      ),
    );
  }
}

/*
*
* NetworkImage(
                              "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png"))
* */
