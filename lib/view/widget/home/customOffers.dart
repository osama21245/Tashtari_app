import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homeControoler.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class Customoffers extends GetView<ImphomePageControoler> {
  const Customoffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text("25".tr,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: const Text("Cashback 20%",
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -20,
          left: controller.langselected == "ar" ? -20 : null,
          right: controller.langselected == "en" ? -20 : null,
          child: Container(
            child: Image.asset(AppImageAsset.logo),
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
