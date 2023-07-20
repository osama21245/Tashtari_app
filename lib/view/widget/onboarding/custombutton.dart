// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/onBoardingControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<onBoardingControllerImp> {
  CustomButtonOnBoarding(this.size, {super.key});

  Size size;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.next();
      },
      child: Text("16".tr),
      textColor: Colors.white,
      color: AppColor.primaryColor,
      minWidth: size.width * 0.6,
    );
  }
}
