import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
import 'package:parkinn/Utils/brand_color.dart';
import 'package:parkinn/Utils/sizes.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                        Text(
                          "ParkInn",
                          style: TextStyle(
                              color: BrandColors.primaryColor,
                              fontSize: constraint.maxHeight * 0.2,
                              fontWeight: FontWeight.w900),
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
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: controller.numberKey,
                      // TODO: NUMBER VALIDATOR
                      child: TextFormField(
                        cursorColor: BrandColors.brandBlack,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Get otp"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: BrandColors.primaryColor),

                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
