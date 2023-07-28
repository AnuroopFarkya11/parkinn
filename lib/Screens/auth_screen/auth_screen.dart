import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Utils/sizes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              title: Text(
                "ParkInn",
                style: TextStyle(fontSize: 35, color: BrandColors.primaryColor),
              ),
              titleSpacing: 40,
               expandedHeight: CustomSizes.height * 0.19,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(CustomSizes.height * 0.18),
                child: Container(
                  height: CustomSizes.height / 6,
                  color: Colors.orange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
