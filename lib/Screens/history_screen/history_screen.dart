import 'package:flutter/material.dart';

//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/history_screen/history_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

import '../../Utils/brand_color.dart';
import '../../Widgets/card_layout/card_layout.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ParkInBar(
                bottomWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                          color: BrandColors.subTitleColor,
                          fontSize: CustomSizes.height * 0.06 * 0.5),
                    ),
                    Container(
                      padding: EdgeInsets.all(CustomSizes.height * 0.008),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: BrandColors.subTitleColor, width: 2.5),
                      ),
                      child: Text("All vehicles",
                          style:
                              TextStyle(color: BrandColors.subTitleColor)),
                    )
                  ],
                ),
              ],
            )),
          

            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Container();
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
