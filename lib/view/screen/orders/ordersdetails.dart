import 'package:flutter/material.dart';
import 'package:woocommerce_app/HandlingDataView.dart';
import 'package:woocommerce_app/controller/orders/ordersdetaisController.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:get/get.dart';
import '../../widget/checkout/customMyCheckoutText.dart';
import '../../widget/orders/ordersdetails/customOrdersDetails.dart';

class OrdersDetails extends GetView<ImpordersdetailsController> {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpordersdetailsController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GetBuilder<ImpordersdetailsController>(
            builder: (c) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 29.0),
                          child: CustomMyCheckouutText(
                            textname: "OrdersDetails",
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.027,
                        ),
                        const CustomTable(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 70.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        if (controller.ordersModel!.ordersType == "0" ||
                            controller.ordersModel!.ordersType == null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 17.0, top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Shipping Address : ",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: AppColor.fourthColor)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ListTile(
                                        title: Text(
                                            "${controller.ordersModel!.addressName}"),
                                        subtitle: Text(
                                            "${controller.ordersModel!.addressCity} _ ${controller.ordersModel!.addressStreet}"),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                      ],
                    ),
                  ),
                )));
  }
}
