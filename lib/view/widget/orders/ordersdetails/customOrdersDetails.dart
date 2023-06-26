import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/orders/ordersdetaisController.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/services/services.dart';

class CustomTable extends GetView<ImpordersdetailsController> {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 14),
      child: Card(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 17),
            child: Table(
              textBaseline: TextBaseline.alphabetic,
              children: [
                const TableRow(children: [
                  Text(
                    "Item",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: AppColor.fourthColor),
                  ),
                  Text("QTY",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, color: AppColor.fourthColor)),
                  Text("Price",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, color: AppColor.fourthColor))
                ]),
                ...List.generate(
                  controller.ordersDetailsData!.length,
                  (index) => TableRow(children: [
                    Text(
                      "${controller.ordersDetailsData![index].itemsName}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${controller.ordersDetailsData![index].itemsCount}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${controller.ordersDetailsData![index].itemsprice}\$",
                      textAlign: TextAlign.center,
                    )
                  ]),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Price = ",
                    style: TextStyle(
                        fontSize: 16,
                        color: myServices.sharedPreferences
                                    .getBool("isDarkMode") ==
                                true
                            ? const Color.fromARGB(255, 214, 211, 214)
                            : const Color.fromARGB(255, 58, 57, 58))),
                Text("${controller.ordersModel!.ordersPricedelivery}\$",
                    style: TextStyle(
                        fontSize: 16,
                        color: myServices.sharedPreferences
                                    .getBool("isDarkMode") ==
                                true
                            ? const Color.fromARGB(255, 214, 211, 214)
                            : const Color.fromARGB(255, 58, 57, 58)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Before coupon = ",
                    style: TextStyle(
                        fontSize: 16,
                        color: myServices.sharedPreferences
                                    .getBool("isDarkMode") ==
                                true
                            ? const Color.fromARGB(255, 214, 211, 214)
                            : const Color.fromARGB(255, 58, 57, 58))),
                Text("${controller.ordersModel!.ordersPrice}\$",
                    style: TextStyle(
                        fontSize: 16,
                        color: myServices.sharedPreferences
                                    .getBool("isDarkMode") ==
                                true
                            ? const Color.fromARGB(255, 214, 211, 214)
                            : const Color.fromARGB(255, 58, 57, 58)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("TotalPrice = ",
                    style:
                        TextStyle(fontSize: 16, color: AppColor.fourthColor)),
                Text("${controller.ordersModel!.ordersTotalprice}\$",
                    style: const TextStyle(
                        fontSize: 16, color: AppColor.fourthColor))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
