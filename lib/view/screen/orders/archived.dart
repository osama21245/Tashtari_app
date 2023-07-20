import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';

import '../../../controller/orders/ordersarchiveController.dart';

import '../../widget/checkout/customMyCheckoutText.dart';
import '../../widget/orders/archive/customRatingDialog.dart';
import '../../widget/orders/archive/customcardArchive.dart';

class Orderarchive extends StatelessWidget {
  const Orderarchive({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImporderArchiveController());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 29.0),
              child: CustomMyCheckouutText(
                textname: "Archive",
              ),
            ),
            SizedBox(
              height: size.height * 0.032,
            ),
            GetBuilder<ImporderArchiveController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      children: [
                        ...List.generate(
                            controller.orderslist.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CustomcardArchive(
                                    onRating: () {
                                      showdialogRating(
                                          context,
                                          controller.orderslist[index].ordersId
                                              .toString());
                                    },
                                    size: size,
                                    orderModel: controller.orderslist[index],
                                  ),
                                ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
