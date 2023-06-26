import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../controller/orders/ordersarchiveController.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/routesname.dart';
import '../../../../data/model/orders_model.dart';

// ignore: camel_case_types, must_be_immutable
class CustomcardArchive extends GetView<ImporderArchiveController> {
  Size size;
  final void Function()? onRating;

  OrdersModel orderModel;

  CustomcardArchive(
      {super.key,
      required this.orderModel,
      required this.size,
      required this.onRating});

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
                child: Text("OrderNumber: #${orderModel.ordersId}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 24, 24, 24),
                        fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Type : ${orderModel.ordersType == "0" ? "Delivery" : "Recive"} ",
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Price Without coupon : ${orderModel.ordersPrice}\$",
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Order Status : ${controller.ReturnorderStatus(orderModel.ordersStatus!)}",
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Delivery Price : ${orderModel.ordersPricedelivery}\$",
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                    "Payment Method  : ${orderModel.ordersPaymenttype == "0" ? "Cash On Delivery" : "Payment Card"}",
                    style: TextStyle(fontSize: 16)),
              ),
              Divider(thickness: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                        "Total Price  : ${orderModel.ordersTotalprice}\$",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 126, 71, 148))),
                  ),
                  Spacer(),
                  MaterialButton(
                    textColor: Colors.white,
                    color: AppColor.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRoutes.OrdersDetails,
                          arguments: {"details": orderModel});
                    },
                    child: Text("Detials"),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: AppColor.primaryColor,
                    onPressed: onRating,
                    child: Text("Rating"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
