import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/orders/orderspendingController.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/routesname.dart';
import '../../../../data/model/orders_model.dart';

// ignore: camel_case_types, must_be_immutable
class CustomcardPending extends GetView<ImporderspendingController> {
  final void Function()? ondelete;

  Size size;

  OrdersModel orderModel;

  CustomcardPending(
      {super.key,
      required this.orderModel,
      required this.size,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 17),
                child: Row(
                  children: [
                    Text("OrderNumber: #${orderModel.ordersId}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 24, 24, 24),
                            fontSize: 22)),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "${orderModel.ordersDatetime}",
                        style: const TextStyle(
                            fontSize: 9,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Type : ${orderModel.ordersType == "0" ? "Delivery" : "Recive"} ",
                    style: const TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Price without coupon : ${orderModel.ordersPrice}\$",
                    style: const TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Status : ${controller.ReturnorderStatus(orderModel.ordersStatus!)}",
                    style: const TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Delivery Price : ${orderModel.ordersPricedelivery}\$",
                    style: const TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Payment Method  : ${orderModel.ordersPaymenttype == "0" ? "Cash On Delivery" : "Payment Card"}",
                    style: const TextStyle(fontSize: 16)),
              ),
              const Divider(thickness: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                        "Total Price  : ${orderModel.ordersTotalprice}\$",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 126, 71, 148))),
                  ),
                  const Spacer(),
                  MaterialButton(
                    minWidth: size.width * 0.12,
                    textColor: Colors.white,
                    color: AppColor.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRoutes.OrdersDetails,
                          arguments: {"details": orderModel});
                    },
                    child: const Text("Detials"),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  if (orderModel.ordersStatus == "0")
                    MaterialButton(
                      minWidth: size.width * 0.1,
                      textColor: Colors.white,
                      color: AppColor.primaryColor,
                      onPressed: ondelete,
                      child: const Text("Remove"),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
