import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imgaeasset.dart';
import '../../../../core/constant/routesname.dart';
import '../../../widget/auth/custombuttonauth.dart';

class sucessResetPassword extends StatelessWidget {
  const sucessResetPassword({super.key});

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
            padding: const EdgeInsets.only(top: 150, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "41".tr,
                  style: const TextStyle(
                      fontSize: 25, color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "42".tr,
                  style: const TextStyle(
                      fontSize: 16, color: AppColor.primaryColor),
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
