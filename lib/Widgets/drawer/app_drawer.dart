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
                  fontWeight: FontWeight.w900
                ),
              ))),
              ListTile(
                selected: GlobalController.to.currentRoute == ParkYnRoute.profileScreen,
                selectedTileColor: BrandColors.primaryColor,
                selectedColor: BrandColors.brandWhite,
                onTap: () {
                  GlobalController.to.currentRoute!=ParkYnRoute.profileScreen?Get.toNamed(ParkYnRoute.profileScreen):Navigator.pop(context);
                },
                title: Text("Your Profile"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                selected: GlobalController.to.currentRoute == ParkYnRoute.homeScreen,
                selectedTileColor: BrandColors.primaryColor,
                selectedColor: BrandColors.brandWhite,
                onTap: () {
                  if (GlobalController.to.customer!.currentTransaction ==
                      null) {
                    GlobalController.to.currentRoute != ParkYnRoute.homeScreen
                        ? Get.offAllNamed(ParkYnRoute.homeScreen)
                        : Navigator.pop(context);
                  } else {
                    GlobalController.to.currentRoute != ParkYnRoute.transactionScreen
                        ? Get.offAllNamed(ParkYnRoute.transactionScreen)
                        : Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text("History"),
                leading: Icon(Icons.history),
                selected: GlobalController.to.currentRoute == ParkYnRoute.historyScreen,
                selectedTileColor: BrandColors.primaryColor,
                selectedColor: BrandColors.brandWhite,
                onTap: () {
                  if(GlobalController.to.currentRoute==ParkYnRoute.historyScreen)
                  {
                    Navigator.pop(context);
                  }
                  else{
                  Get.offAllNamed(ParkYnRoute.historyScreen);
                  }
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
