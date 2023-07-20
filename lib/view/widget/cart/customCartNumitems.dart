import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../controller/cartController.dart';

// ignore: must_be_immutable
class CustomNuminCart extends GetView<ImpcartController> {
  Size size;
  CustomNuminCart({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18.0),
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "72".tr,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              width: 4,
            ),
            Text("${controller.totalcount} ",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 3,
            ),
            Text("73".tr, style: const TextStyle(color: Colors.grey))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: const BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
