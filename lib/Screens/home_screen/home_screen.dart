import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';

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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ParkInBar(
              actionCheck: true,
              subTitle: "Select vehicle",
            ),
            SliverFillRemaining(
              //hasScrollBody: false,
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
                                onPressed: () {}, child: Text("New vehicle")),
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
            ),
          ],
        ),
      ),
    );
  }
}
