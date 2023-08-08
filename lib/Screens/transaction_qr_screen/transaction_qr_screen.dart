import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/transaction_qr_screen/transaction_qr_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/card_layout/card_layout.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

class TransactionQr extends GetView<TransactionQrController> {
  const TransactionQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ParkInDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ParkInBar(
              bottomWidget: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            tileColor: BrandColors.primaryColor,
            title: Text("Vehicle Number"),
            subtitle: Text("Vehicle type"),
            trailing: TextButton(
              onPressed: () {},
              child: Text("Change Vehicle"),
              style:
                  TextButton.styleFrom(backgroundColor: BrandColors.brandWhite),
            ),
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: BrandColors.subTitleColor,width:2),
                      ),
                      child: Image.network(
                        "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png",
                        fit: BoxFit.fill,
                        height: CustomSizes.height * 0.4,
                      ),
                    ),
                    Text("Parking time not started")
                  ],
                )),
                ListTile(
                  tileColor: BrandColors.brandWhite,
                  title: Text("Balance",style: TextStyle(fontSize: 13,color: BrandColors.subTitleColor),),
                  subtitle: Text("Rs.400",style: TextStyle(fontSize: 20,color: BrandColors.brandBlack),),
                  trailing: ElevatedButton(onPressed: (){},child: Text("Recharge"),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
*
* NetworkImage(
                              "https://www.investopedia.com/thmb/hJrIBjjMBGfx0oa_bHAgZ9AWyn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/qr-code-bc94057f452f4806af70fd34540f72ad.png"))
* */
