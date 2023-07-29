import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/home_screen/home_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';

class HomeScreen extends GetView<HomeController>{

  /*
  * todo : daksh
  *
  *
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(

          slivers: [

            const ParkInBar(actionCheck: true,subTitle: "Select vehicle",subtitleHeight: CustomSizes.subSmall,)


          ],

        ),
      ),
    );
  }

}