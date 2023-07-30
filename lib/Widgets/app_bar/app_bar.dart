import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Widgets/app_bar/app_bar_controller.dart';

import '../../Utils/brand_color.dart';
import '../../Utils/sizes.dart';
class ParkInBar extends GetView<ParkInnBarController>{
  final bool? actionCheck;
  final String subTitle;
  final bool isBold;
  final double? subtitleHeight;
  const ParkInBar({super.key,required this.subTitle,this.actionCheck=false,this.isBold=false,this.subtitleHeight=CustomSizes.subSmall});

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      title: const Text("ParkInn"),
      titleTextStyle: TextStyle(color: BrandColors.primaryColor,fontSize: 35,fontWeight: FontWeight.w500),

      // actions: [
      //   IconButton(onPressed: (){
      //
      //   }, icon: Icon(Icons.menu))
      // ],

      // titleSpacing: 10,
      // expandedHeight: Get.height*0.1,
      // flexibleSpace: LayoutBuilder(builder: (context,constraint){
      //   return Text("Select Vehicle");
      // }),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Get.height*0.06),
        child: Container(
          // color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
          height: Size.fromHeight(Get.height*0.06).height,
          width: Get.width,
          // color: Colors.black,
          child: Row(
            children: [
              Text(
                subTitle.split(" ")[0],
                style: TextStyle(
                    color: BrandColors.subTitleColor,
                    fontSize: Get.height*0.06 * 0.5),
              ),
              Text(
                " "+subTitle.split(" ")[1],
                style: TextStyle(
                    color: BrandColors.subTitleColor,
                    fontSize: Get.height*0.06 * 0.5,
                    fontWeight: isBold?FontWeight.w900:FontWeight.w500),
              )
            ],
          ),
        ),
      ),


    );
  }

}



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