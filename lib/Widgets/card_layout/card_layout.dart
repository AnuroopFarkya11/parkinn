import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/card_layout/card_controller.dart';

class ParkInnCard extends GetView<CardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Card(
            elevation: 3,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text("KA 02 DM 1107", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),),
              subtitle: Text("2 wheeler"),
              trailing: IconButton(onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 40),

              tileColor: controller.isSelected.value ? BrandColors.primaryColor : Colors
                  .transparent,
              onTap: () {
                controller.isSelected.value = !controller.isSelected.value;
              },
            ),
          ),
    );
  }

}