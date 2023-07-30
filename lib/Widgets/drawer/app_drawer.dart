import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: (){},
              ), ListTile(
                title: Text("History"),
                leading: Icon(Icons.history),
                onTap: (){},
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
          Expanded(
              child:Container(child: Align(alignment: Alignment.bottomCenter,child:  ListTile(
                title: Text("About Developer"),
                leading: Icon(Icons.info_outline),
              ),),))
        ],
      ),
    );
  }
}
