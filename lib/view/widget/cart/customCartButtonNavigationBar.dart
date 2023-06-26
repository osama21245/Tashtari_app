import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../controller/cartController.dart';
import '../itemdetails/custombuttomNavigationbar.dart';
import 'customCartPrice.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends GetView<ImpcartController> {
  final void Function() onbuy;
  final void Function() oncoupon;
  TextEditingController? coponcode;

  CustomBottomNavigationBar({
    super.key,
    required this.coponcode,
    required this.onbuy,
    required this.oncoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<ImpcartController>(
              builder: (controller2) => controller.couponname == null
                  ? Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 10, top: 15),
                            child: Container(
                              child: TextField(
                                controller: coponcode,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Enter Code",
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CustombuttomNavigationbar(
                                buttonName: "Coupon",
                                onpressed: oncoupon,
                              ),
                            ))
                      ],
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        top: 14,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Coupon Code",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                              "  ${controller.couponname} - ${controller.couponmodel!.couponDiscount}%",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 144, 92, 165)))
                        ],
                      ),
                    )),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: AppColor.primaryColor, width: 1)),
            child: Column(
              children: [
                CustomCartPrice(
                  Texte: "Price",
                  Price: "${controller.totalpriceOfitem}\$",
                  active: false,
                ),
                CustomCartPrice(
                  Texte: "Shipping",
                  Price: "0.0\$",
                  active: false,
                ),
                CustomCartPrice(
                  Texte: "discount",
                  Price: "${controller.discountAmount}\$",
                  active: false,
                ),
                const Divider(thickness: 3),
                CustomCartPrice(
                  Texte: "Total Price",
                  Price: "${controller.finalprice}\$",
                  active: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CustombuttomNavigationbar(
              buttonName: "Order",
              onpressed: onbuy,
            ),
          )
        ],
      ),
    );
  }
}
