import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';

import '../../../controller/orders/orderspendingController.dart';
import '../../widget/checkout/customMyCheckoutText.dart';
import '../../widget/orders/pending/customcardPending.dart';

class Orderspending extends StatelessWidget {
  const Orderspending({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImporderspendingController());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 29.0),
              child: CustomMyCheckouutText(
                textname: "Orders",
              ),
            ),
            SizedBox(
              height: size.height * 0.032,
            ),
            GetBuilder<ImporderspendingController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      children: [
                        ...List.generate(
                            controller.orderslist.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CustomcardPending(
                                    ondelete: () async {
                                      await controller.delteData(controller
                                          .orderslist[index].ordersId
                                          .toString());
                                      controller.refreshpage();
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

// ignore: camel_case_types, must_be_immutable
