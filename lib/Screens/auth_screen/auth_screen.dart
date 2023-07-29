import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
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
            const ParkInBar(subTitle: "Simple parking.",isBold: true,),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParkInField(
                        labelText: "Mobile Number",
                        textInputType: TextInputType.number,
                        formKey: controller.numberKey,
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
                    ElevatedButton(
                      onPressed: () {
                        controller.otpCheck.value = true;
                      },
                      child: const Text("Get otp"),
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
