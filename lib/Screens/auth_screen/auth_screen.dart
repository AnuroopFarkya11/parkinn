import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';
import 'package:parkinn/Services/API/api_services.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Utils/sizes.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';
import 'package:parkinn/Widgets/form_textfield/formfield.dart';
import '../../Modals/customer_modal.dart';
import '../../Utils/brand_color.dart';
import '../../Widgets/app_bar/parkyn_bar.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ParkynBar(
              titleWidget: Row(
                children: [
                  Text(
                    "Parkyn",
                    style: TextStyle(
                        color: BrandColors.primaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                  Image.asset(
                    "assets/icons/icon_full.png",
                    height: 35,
                  )
                ],
              ),
              expandedHeight: CustomSizes.height * 0.07,
              bottomWidget: Row(
                children: [
                  Text(
                    'Get a ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: CustomSizes.height * 0.040),
                  ),
                  Text(
                    ' Parkyn Tag.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: CustomSizes.height * 0.040,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: CustomSizes.height * 0.04),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        if (controller.otpCheck.value) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Otp sent to +91${controller.numberController.text}"),
                              SizedBox(
                                height: CustomSizes.height * 0.03,
                              ),
                              Text(
                                "OTP",
                                style: TextStyle(
                                    color: BrandColors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                              OtpTextField(
                                cursorColor: BrandColors.black,
                                mainAxisAlignment: MainAxisAlignment.start,
                                keyboardType: TextInputType.number,
                                numberOfFields: 5,
                                onCodeChanged: (value) {
                                  if (value.length < 5) {
                                    controller.isSubmitEnabled.value = false;
                                  }
                                },
                                onSubmit: (value) {
                                  if (value.length == 5) {
                                    controller.isSubmitEnabled.value = true;
                                    controller.otp = value;
                                  }
                                },
                              ),
                              SizedBox(
                                height: CustomSizes.height * 0.03,
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => ElevatedButton(
                                      onPressed:
                                          controller.isSubmitEnabled.value
                                              ? controller.onVerifyOtp
                                              : null,
                                      child: controller.isLoading.value
                                          ? const SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 3.0,
                                              ))
                                          : const Text("Submit",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        controller.otpCheck.value = false;
                                      },
                                      child: Text("Back"))
                                ],
                              )
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParkInField(
                                  validator: controller.onNumberValidator,
                                  labelText: "Mobile Number",
                                  textInputType: TextInputType.number,
                                  formKey: controller.numberKey,
                                  focusNode: controller.numberFocus,
                                  controller: controller.numberController,
                                onchanged: (value){
                                    if(value.length<10)
                                      {
                                        controller.isGetOtpEnabled.value = false;
                                      }
                                    else{
                                      controller.isGetOtpEnabled.value = true;
                                    }
                                },
                              ),
                              SizedBox(
                                height: CustomSizes.height * 0.03,
                              ),
                              Obx(
                                () => ElevatedButton(
                                  onPressed: controller.isGetOtpEnabled.value
                                      ? controller.onGetOtp
                                      : null,
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3.0,
                                          ))
                                      : const Text("Get otp",
                                          style:
                                              TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          );
                        }
                      }),
                      SizedBox(
                        height: CustomSizes.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
