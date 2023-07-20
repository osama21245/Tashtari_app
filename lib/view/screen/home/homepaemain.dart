import 'dart:io';

import 'package:flutter/material.dart';
import 'package:woocommerce_app/controller/home/homemainControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:get/get.dart';

import '../../widget/homeMain/custombuttomAppbarHome.dart';

class Homemain extends StatelessWidget {
  const Homemain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImphomePageMainController());
    return GetBuilder<ImphomePageMainController>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.secoundColor,
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const customBottomAppBarHome(),
          body: WillPopScope(
              child: controller.listpage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                    title: "46".tr,
                    middleText: "47".tr,
                    onConfirm: () {
                      exit(0);
                    },
                    onCancel: () {},
                    buttonColor: AppColor.primaryColor,
                    confirmTextColor: Colors.white,
                    cancelTextColor: AppColor.primaryColor,
                    textConfirm: "48".tr,
                    textCancel: "49".tr);
                return Future.value(false);
              })),
    );
  }
}
