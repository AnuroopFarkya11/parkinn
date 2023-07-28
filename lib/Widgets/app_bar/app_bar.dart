import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Widgets/app_bar/app_bar_controller.dart';

import '../../Utils/brand_color.dart';
import '../../Utils/sizes.dart';
class ParkInBar extends GetView<ParkInnBarController>{
  final bool? actionCheck;
  const ParkInBar({super.key,this.actionCheck=false});

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      expandedHeight: CustomSizes.height * 0.17,
      // backgroundColor: Colors.black54,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            // color: Colors.blue,
            padding: const EdgeInsets.all(12),
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ParkInn",
                      style: TextStyle(
                          color: BrandColors.primaryColor,
                          fontSize: constraint.maxHeight * 0.2,
                          fontWeight: FontWeight.w900),
                    ),
                    actionCheck!?const Icon(Icons.menu):const SizedBox(width: 0,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Simple ",
                      style: TextStyle(
                          color: BrandColors.subTitleColor,
                          fontSize: constraint.maxWidth * 0.11),
                    ),
                    Text(
                      "parking.",
                      style: TextStyle(
                          color: BrandColors.subTitleColor,
                          fontSize: constraint.maxWidth * 0.11,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),

    );
  }

}