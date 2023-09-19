import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/view/widget/offers/customOffersCard.dart';

import 'HandlingDataView.dart';
import 'controller/offersController.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpoffersController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: GetBuilder<ImpoffersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statuesRequest,
              widget: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Color.fromARGB(0, 39, 176, 153),
                      height: Get.height / 150,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: Get.height / 9),
                            width: double.infinity,
                            height: Get.height,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                          ),
                          ListView.builder(
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) => CustomOffersCard(
                                    itemmodel: controller.data[index],
                                  )),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
