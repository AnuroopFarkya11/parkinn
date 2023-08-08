import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';
import 'package:parkinn/Services/API/api_services.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/form_textfield/formfield.dart';
import '../../Modals/customer_modal.dart';
import '../../Utils/brand_color.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // const ParkInBar(subTitle: "Simple parking.", isBold: true,subtitleHeight:CustomSizes.subLarge ),
            ParkInBar(
                bottomWidget: Row(
              children: [
                Text(
                  'Simple',
                  style: TextStyle(
                      color: BrandColors.subTitleColor,
                      fontSize: CustomSizes.width * 0.11),
                ),
                Text(
                  ' parking.',
                  style: TextStyle(
                      color: BrandColors.subTitleColor,
                      fontSize: CustomSizes.width * 0.11,
                      fontWeight: FontWeight.w900),
                ),
              ],
            )),
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
                            validator: controller.onOtpValidation,
                            controller: controller.otpController
                        );
                      } else {
                        return Container();
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.otpCheck.value?controller.onVerifyOtp:controller.onGetOtp,
                        child: controller.isLoading.value
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ))
                            : controller.otpCheck.value
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
