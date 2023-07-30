import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/brand_color.dart';
class NewBar extends StatelessWidget {
  const NewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      // floating: true,
      // snap: true,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      title: Text("ParkInn"),
      titleTextStyle: TextStyle(color: BrandColors.primaryColor,fontSize: 35,fontWeight: FontWeight.w500),
      actions: [
        Icon(Icons.menu),
        SizedBox(width: 20,)
      ],

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
          child: Text("Select Vehicle",style: TextStyle(color: BrandColors.subTitleColor,fontSize: 25),) ,
        ),
      ),


    );
  }
}
