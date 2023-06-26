import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
        child: Text(
          "there is ${controller.totalcount} items in your cart",
          style: TextStyle(color: Colors.grey),
        ),
        decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
