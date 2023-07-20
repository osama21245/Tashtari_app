import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/view/widget/checkout/customMyCheckoutText.dart';

import 'HandlingDataView.dart';
import 'controller/notification/notificationController.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(Impnotificaioncontroller());
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 29.0),
          child: CustomMyCheckouutText(
            textname: "97".tr,
          ),
        ),
        SizedBox(
          height: size.height * 0.032,
        ),
        GetBuilder<Impnotificaioncontroller>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    ...List.generate(
                        controller.notifications.length,
                        (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    trailing: const Icon(
                                        Icons.notifications_active_outlined),
                                    title: Text(
                                      "${controller.notifications[index]["notification_title"]}",
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        "${controller.notifications[index]["notification_body"]}"),
                                  ),
                                ),
                                Positioned(
                                    right: 65,
                                    top: 11,
                                    child: Text(
                                      "${controller.notifications[index]["notification_datetime"]}",
                                      style: const TextStyle(
                                          color: AppColor.primaryColor),
                                    ))
                              ],
                            )))
                  ],
                )))
      ],
    );
  }
}
