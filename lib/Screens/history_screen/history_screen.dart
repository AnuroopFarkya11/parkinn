import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/history_screen/history_controller.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/app_bar/parkyn_bar.dart';
import 'package:parkinn/Widgets/card_layout/history_card.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';
import '../../Utils/brand_color.dart';

class History extends GetView<HistoryController> {
  const History({super.key});

  /*
  * todo
  * make a different tile for history
  *
  *
  * */
  @override
  Widget build(BuildContext context) {
    //  Map<String, String> map = GlobalController.to.customer!.history!.asMap().cast<String, String>();
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            ParkynBar(titleWidget:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "History",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: CustomSizes.height * 0.06 * 0.5),
                ),
                // SizedBox(height: CustomSizes.height*0.01,),
                Divider(height: 10,endIndent: 210,indent: 1,),
              ],
            ), expandedHeight: CustomSizes.height*0.05,bottomWidget:Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(CustomSizes.height * 0.008),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: BrandColors.subTitleColor, width: 2.5),
                ),
                child: Text("All vehicles",
                    style: TextStyle(color: BrandColors.subTitleColor)),
              ),
            )

            ),


            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.all(12),
                child: controller.customer!.history!.isEmpty
                    ? Center(
                        child: Text("No Transaction Record"),
                      )
                    : ListView.builder(
                        // reverse: true,
                        shrinkWrap: true,
                        itemCount: controller.customer!.history!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              HistoryCard(
                                vehicleNumber: controller
                                    .history![index]!.vehicleData!.vehicleNumber!,
                                vehicleType: controller
                                    .history![index]!.vehicleData!.vehicleType!,
                                location: controller.history![index]!.locationId!,
                                //todo Pass the original values
                                closingBalance: "360",
                                amount: '60',
                              ),
                              Divider(height: 5,indent: 15,endIndent: 15,)
                            ],
                          );
                          // return ParkInnCard("Ramji", "4 wheeler");
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
