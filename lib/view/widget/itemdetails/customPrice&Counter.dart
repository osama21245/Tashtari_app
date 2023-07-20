import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/item/itemdetailsController.dart';
import '../../../core/constant/color.dart';

class CustomPriceCounter extends StatelessWidget {
  const CustomPriceCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ImpitemdetailsController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 5),
      child: Row(
        children: [
          GetBuilder<ImpitemdetailsController>(
            builder: (controller) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.counterdecress(
                          controller.itemmodel!.itemsId.toString());
                    },
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${controller.counter2}",
                      style: const TextStyle(
                          fontSize: 24, color: AppColor.primaryColor),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        controller.counterIncress(
                            controller.itemmodel!.itemsId.toString());
                      },
                      child: const Icon(Icons.add)),
                ],
              );
            },
          ),
          const Spacer(),
          GetBuilder<ImpitemdetailsController>(
              builder: (controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "${controller.counter2 == 0 ? "54".tr : "${controller.price2}"} \$",
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryColor,
                    ),
                  )))
        ],
      ),
    );
  }
}
