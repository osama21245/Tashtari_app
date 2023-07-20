import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/widget/offers/customOffersCard.dart';

import 'HandlingDataView.dart';
import 'controller/offersController.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpoffersController());
    return GetBuilder<ImpoffersController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statuesRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CustomOffersCard(
                      itemmodel: controller.data[index],
                    ))));
  }
}
