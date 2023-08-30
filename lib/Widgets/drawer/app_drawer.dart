import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:parkinn/Theme/app_theme.dart';
import 'package:parkinn/routes/route_name.dart';
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
                GlobalController.to.companyName,
                style: TextStyle(
                    color: BrandColors.primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ))),
              DrawerTile(
                  title: "Your Profile",
                  leading: Icons.person,
                  onTap: () {
                    GlobalController.to.currentRoute !=
                            ParkYnRoute.profileScreen
                        ? Get.toNamed(ParkYnRoute.profileScreen)
                        : Navigator.pop(context);
                  },
                  selected: GlobalController.to.currentRoute ==
                      ParkYnRoute.profileScreen),
              DrawerTile(
                  title: "Home",
                  leading: Icons.home,
                  onTap: () {
                    if (GlobalController.to.customer!.currentTransaction ==
                        null) {
                      GlobalController.to.currentRoute != ParkYnRoute.homeScreen
                          ? Get.offAllNamed(ParkYnRoute.homeScreen)
                          : Navigator.pop(context);
                    } else {
                      GlobalController.to.currentRoute !=
                              ParkYnRoute.transactionScreen
                          ? Get.offAllNamed(ParkYnRoute.transactionScreen)
                          : Navigator.pop(context);
                    }
                  },
                  selected: GlobalController.to.currentRoute ==
                      ParkYnRoute.homeScreen),
              DrawerTile(
                  title: "History",
                  leading: Icons.history,
                  onTap: () {
                    if (GlobalController.to.currentRoute ==
                        ParkYnRoute.historyScreen) {
                      Navigator.pop(context);
                    } else {
                      Get.offAllNamed(ParkYnRoute.historyScreen);
                    }
                  },
                  selected: GlobalController.to.currentRoute ==
                      ParkYnRoute.historyScreen),
              DrawerTile(
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
                title: "Change Theme",
                leading:Icons.dark_mode,
              ),
              ListTile(
                onTap: () {
                  SharedService.setStatus(status: false);
                  SharedService.setCustomerId(" ", " ");
                  // GlobalController.to.dispose();
                  Get.offNamed(ParkYnRoute.authScreen);
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
                title: Text("About ${GlobalController.to.companyName}"),
                leading: Icon(Icons.info_outline),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  String title;
  IconData leading;
  Function() onTap;
  bool selected;

  DrawerTile(
      {Key? key,
      required this.title,
      required this.leading,
      required this.onTap,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedTileColor: BrandColors.black,
      selectedColor: BrandColors.brandWhite,
      onTap: onTap,
      title: Text(title),
      leading: Icon(leading),
    );
  }
}
