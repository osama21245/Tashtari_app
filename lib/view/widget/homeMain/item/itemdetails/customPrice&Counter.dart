import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../controller/item/itemdetailsController.dart';
import '../../../../../core/constant/color.dart';

class CustomPriceCounter extends StatelessWidget {
  CustomPriceCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ImpitemdetailsController controller = Get.put(ImpitemdetailsController());
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
                      if (controller.counter! > 0) {
                        controller.counterdecress();
                        controller
                            .changeprice(controller.itemmodel!.itemsPrice);
                        print(controller.price2);
                      }
                    },
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${controller.counter}",
                      style:
                          TextStyle(fontSize: 24, color: AppColor.primaryColor),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        controller.counterIncress();
                        controller
                            .changeprice(controller.itemmodel!.itemsPrice);
                        print(controller.price2);
                      },
                      child: Icon(Icons.add)),
                ],
              );
            },
          ),
          Spacer(),
          GetBuilder<ImpitemdetailsController>(
              builder: (controller) => Text(
                    "${controller.price2} \$",
                    style: TextStyle(fontSize: 23, color: AppColor.thirdColor),
                  ))
        ],
      ),
    );
  }
}
