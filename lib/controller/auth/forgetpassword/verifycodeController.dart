import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

abstract class verifycodeController extends GetxController {
  checkcode();

  gotoresetpassword();
  String? email;
}

class ImpverifycodeController extends verifycodeController {
  late String verifycode;

  @override
  checkcode() {}

  @override
  gotoresetpassword() {
    Get.offNamed(AppRoutes.resetPassword, arguments: {"e": email});
  }

  @override
  void onInit() {
    email = Get.arguments["e"];

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
