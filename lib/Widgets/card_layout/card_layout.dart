import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/card_layout/card_controller.dart';

import '../../Modals/vehicle_modal.dart';

class ParkInnCard extends StatelessWidget {
  final CardController controller = Get.put(CardController());
  late final Vehicle vehicle;
  late final Function() onTap;
  final bool isVehicleSelected;

  // ParkInnCard(this.vehicleNumber, this.vehicleType, {super.key});

  ParkInnCard(
      {super.key,
      required this.vehicle,
      required this.isVehicleSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          title: Text(
            vehicle.vehicleNumber!,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vehicle.vehicleType!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(vehicle.vehicleType!),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 20),
            ],
          ),
          tileColor:
              isVehicleSelected ? BrandColors.primaryColor : Colors.transparent,
          onTap: onTap,
        ),
      );

  }
}
