import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';

// ignore: non_constant_identifier_names
Future<bool> ExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do You Want To Leave App ",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text("Confirm")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"))
      ]);
  return Future.value(true);
}
