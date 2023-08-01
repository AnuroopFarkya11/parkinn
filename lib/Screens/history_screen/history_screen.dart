
import 'package:flutter/material.dart';

//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/history_screen/history_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

import '../../Widgets/card_layout/card_layout.dart';

class History extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      endDrawer: ParkInDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ParkInBar(subTitle: "History  ",showContainer: true, ),

            SliverFillRemaining(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ParkInnCard("Ramji", "4 wheeler");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
