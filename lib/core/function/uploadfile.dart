import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../../controller/item/itemdetailsController.dart';
import '../../view/widget/itemdetails/CustomAiChatTextField.dart';
import '../../view/widget/itemdetails/CustomAiMessage.dart';

ShowBottomMenu(Size size) {
  return Get.bottomSheet(
    Container(
      height: size.height * 0.39,
      width: size.width,
      decoration: BoxDecoration(
          color: myservices.sharedPreferences.getBool("isDarkMode") == true
              ? Color.fromARGB(234, 88, 88, 88)
              : Color.fromARGB(235, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          )),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: GetBuilder<ImpitemdetailsController>(
                builder: ((controller) => ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CustomMessage(),
                      ],
                    )),
              )),
          Expanded(child: CustomChatTextField())
        ],
      ),
    ),
  );
}
