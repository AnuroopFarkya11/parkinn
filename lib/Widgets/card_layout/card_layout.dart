import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Widgets/card_layout/card_controller.dart';

import '../../Modals/vehicle_modal.dart';
import '../../Services/API/api_services.dart';

class ParkInnCard extends StatefulWidget {
  late final Vehicle vehicle;
  late final Function() onTap;
  late void Function() trailingOnTap;
  final bool isVehicleSelected;

  ParkInnCard(
      {super.key,
      required this.vehicle,
      required this.isVehicleSelected,
      required this.onTap,
      required this.trailingOnTap});

  @override
  State<ParkInnCard> createState() => _ParkInnCardState();
}

class _ParkInnCardState extends State<ParkInnCard> {
  final HomeController iconController = Get.put(HomeController());
  final CardController controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: widget.isVehicleSelected ? BrandColors.primaryColor : Colors.white,
      child: ListTile(
        title: Text(
          widget.vehicle.vehicleNumber!,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.vehicle.vehicleType!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(vehicle.vehicleType!),
            Obx(
              () => IconButton(
                  onPressed: widget.trailingOnTap,
                  icon: iconController.deleteTap.value
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 3,
                          ))
                      : Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 25),
            ),
          ],
        ),
        // selected: isVehicleSelected,
        // tileColor:
        //     isVehicleSelected ? BrandColors.primaryColor : Colors.transparent,
        onTap: widget.onTap,
      ),
    );
  }
}
