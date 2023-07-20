import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/auth/custombuttonauth.dart';

class sucessSignup extends StatelessWidget {
  const sucessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "40".tr,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.login);
                })),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 150, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "43".tr,
                  style: const TextStyle(
                      fontSize: 25, color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "44".tr,
                  style: const TextStyle(
                      fontSize: 15, color: AppColor.primaryColor),
                ),
                LottieBuilder.asset(
                  AppImageAsset.done,
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
