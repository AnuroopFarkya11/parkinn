import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/transaction_qr_screen/transaction_qr_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

class TransactionQr extends GetView<TransactionQrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ParkInBar(subTitle: "    "),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ParkInnCard("Hanumanji", " 4 wheeler"),
                Container(
                  height: CustomSizes.height / 2,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: BrandColors.primaryColor, width: 3),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png")))),
                  ),
                ),
                Text(
                  "Parking time not started",
                  style: TextStyle(color: BrandColors.primaryColor),
                ),
                SizedBox(
                  height: 105,
                ),
                Container(
                  // height: 60,
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
