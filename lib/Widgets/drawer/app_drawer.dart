import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/brand_color.dart';

class ParkInDrawer extends StatelessWidget {
  const ParkInDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: Center(
                      child: Text(
                "ParkInn",
                style: TextStyle(
                  color: BrandColors.primaryColor,
                  fontSize: 40,
                ),
              ))),
              ListTile(
                onTap: () {
                  Get.toNamed("/profileScreen");
                },
                title: Text("Your Profile"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Get.offAllNamed('homeScreen');
                },
              ),
              ListTile(
                title: Text("History"),
                leading: Icon(Icons.history),
                onTap: () {
                  Get.offAllNamed('historyScreen');
                },
              ),

              ListTile(
                onTap: () {
                  SharedService.setStatus(status: false);
                  SharedService.setCustomerId(" ", " ");
                  // GlobalController.to.dispose();
                  Get.offNamed('/authScreen');
                },
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
          Expanded(
              child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text("About Developer"),
                leading: Icon(Icons.info_outline),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
