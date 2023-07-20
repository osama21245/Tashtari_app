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
              gradient: LinearGradient(
                  colors: [
                    AppColor.fifththColor,
                    AppColor.primaryColor,
                    AppColor.secoundColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 4)),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(controller.settingTitle,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
            subtitle: Text(controller.settingsbody,
                style: const TextStyle(color: Colors.white, fontSize: 23)),
          ),
        ),
        Positioned(
            top: -20,
            left: controller.langselected == "ar" ? -20 : null,
            right: controller.langselected == "en" ? -20 : null,
            child: CircleAvatar(
              backgroundColor: AppColor.sexColor,
              radius: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 30.0),
                child: Image.asset(
                  AppImageAsset.logo,
                ),
              ),
            ))
      ]),
    );
  }
}
