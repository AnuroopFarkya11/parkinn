import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';
import 'package:parkinn/Services/API/api_services.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/form_textfield/formfield.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ParkInBar(
                subTitle: "Simple parking.",
                isBold: true,
                subtitleHeight: CustomSizes.subLarge),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParkInField(
                        validator: controller.onNumberValidator,
                        labelText: "Mobile Number",
                        textInputType: TextInputType.number,
                        formKey: controller.numberKey,
                        focusNode: controller.numberFocus,
                        controller: controller.numberController),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      if (controller.otpCheck.value) {
                        return ParkInField(
                            labelText: "OTP",
                            textInputType: TextInputType.number,
                            formKey: controller.otpKey,
                            controller: controller.otpController);
                      } else {
                        return Container();
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.onTap,
                        onLongPress: () {
                          if (controller.numberKey.currentState!.validate()) {
                            FutureBuilder(
                              future: API.createUser(
                                  controller.numberController.text,
                                  controller.otpController.text),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Customer> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  }
                                  Customer? customer = snapshot.data;
                                  // log(name: "AUTH SCREEN", "${customer!.mobileNumber}");
                                  Get.offAll(() => HomeScreen());
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          }

                          Get.toNamed('homeScreen');
                        },
                        child: controller.otpCheck.value
                            ? const Text("Verify otp")
                            : const Text("Get otp"),
                      ),
                    ),
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
