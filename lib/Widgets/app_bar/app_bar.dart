import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Widgets/app_bar/app_bar_controller.dart';

import '../../Utils/brand_color.dart';
import '../../Utils/sizes.dart';

class ParkInBar extends GetView<ParkInnBarController> {
  // final bool? actionCheck;
  // final String subTitle;
  // final bool isBold;
  // final double? subtitleHeight;
  // final bool showContainer;

  final Widget titleWidget;

  Widget bottomWidget;
  final bool isBottomEnabled;

  ParkInBar({super.key, required this.bottomWidget, required this.titleWidget,this.isBottomEnabled=false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      // backgroundColor: Colors.white,
      actionsIconTheme: const IconThemeData(color: Colors.black),
      title: titleWidget,
      expandedHeight: 0,

      bottom: isBottomEnabled?PreferredSize(
        preferredSize: Size.fromHeight(CustomSizes.height * 0.07),
        child: bottomWidget,
      ):null,
    );
  }
}

/*
* Row(
            children: [
              Text(
                subTitle.split(" ")[0],
                style: TextStyle(
                    color: BrandColors.subTitleColor,
                    fontSize: Get.height * 0.06 * 0.5),
              ),
              Text(
                " ${subTitle.split(" ")[1]}",
                style: TextStyle(
                    color: BrandColors.subTitleColor,
                    fontSize: Get.height * 0.06 * 0.5,
                    fontWeight: isBold ? FontWeight.w900 : FontWeight.w500),
              ),
              SizedBox(
                width: 180,
              ),
              showContainer
                  ? Container(
                      height: CustomSizes.height * 0.05,
                      width: CustomSizes.width * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: BrandColors.primaryColor, width: 2.5),
                      ),
                      child: Center(
                          child: Text("All vehicles",
                              style:
                                  TextStyle(color: BrandColors.primaryColor))),
                    )
                  : Container(),
            ],
          )
* */

/*
*  SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: CustomSizes.height * 0.17,
      // backgroundColor: Colors.black54,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraint) {
          return constraint.maxHeight< CustomSizes.height * 0.17?Container():Container(
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
                      subTitle.split(" ")[0],
                      style: TextStyle(
                          color: BrandColors.subTitleColor,
                          fontSize: constraint.maxWidth * subtitleHeight!),
                    ),
                    Text(
                      " "+subTitle.split(" ")[1],
                      style: TextStyle(
                          color: BrandColors.subTitleColor,
                          fontSize: constraint.maxWidth * subtitleHeight!,
                          fontWeight: isBold?FontWeight.w900:FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),

    )
*
*
* */
