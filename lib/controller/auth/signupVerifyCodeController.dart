import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

abstract class signupVerifycodeController extends GetxController {
  checkcode();

  gotoSuccesSignUp();
  String? email;
}

class ImpsignupVerifycodeController extends signupVerifycodeController {
  late String verifycode;

  @override
  checkcode() {}

  @override
  gotoSuccesSignUp() {
    Get.offNamed(
      AppRoutes.sucsessSignup,
    );
  }

  @override
  void onInit() {
    email = Get.arguments["o"];

    // Get.defaultDialog(
    //     title: "Done", middleText: "Your email has been created active it");

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
