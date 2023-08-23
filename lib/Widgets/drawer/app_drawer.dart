import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:parkinn/Theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/brand_color.dart';

class ParkInDrawer extends StatelessWidget {
  static String currentRoute = "";

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
                  if(currentRoute=='/profileScreen')
                  {
                    Navigator.pop(context);
                  }
                  Get.toNamed("/profileScreen");
                  currentRoute = "/profileScreen";


                },
                title: Text("Your Profile"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  currentRoute="homeScreen";
                  if (GlobalController.to.customer!.currentTransaction ==
                      null) {
                    currentRoute != "homeScreen"
                        ? Get.offAllNamed('homeScreen')
                        : Navigator.pop(context);
                  } else {
                    currentRoute != "transactionQr"
                        ? Get.offAllNamed('transactionQr')
                        : Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text("History"),
                leading: Icon(Icons.history),
                onTap: () {
                  if(currentRoute=='historyScreen');
                  {
                    Navigator.pop(context);
                  }
                  Get.offAllNamed('historyScreen');
                },
              ),
              ListTile(
                onTap: () {
                  bool? currentTheme = SharedService.getThemeStatus();
                  if (currentTheme == null) {
                    // this indicates dark theme
                    SharedService.setThemeStatus(status: false);
                    Get.changeTheme(AppTheme.darkTheme);
                  } else {
                    SharedService.setThemeStatus(status: !currentTheme);
                    Get.changeTheme(!currentTheme
                        ? AppTheme.lightTheme
                        : AppTheme.darkTheme);
                  }
                },
                title: Text("Change Theme"),
                leading: Icon(Icons.dark_mode),
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
