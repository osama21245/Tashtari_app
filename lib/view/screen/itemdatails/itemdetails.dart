import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';
import 'package:woocommerce_app/view/widget/itemdetails/customBoxsColor.dart';
import 'package:woocommerce_app/view/widget/itemdetails/customPrice&Counter.dart';
import 'package:woocommerce_app/view/widget/itemdetails/customTitle.dart';

import '../../../HandlingDataView.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../widget/itemdetails/customImage.dart';
import '../../widget/itemdetails/custombuttomNavigationbar.dart';

class itemdetails extends GetView<ImpitemdetailsController> {
  const itemdetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpitemdetailsController());

    return Scaffold(
        bottomNavigationBar: CustombuttomNavigationbar(
          buttonName: "52".tr,
          onpressed: () {
            controller.gotocart();
          },
        ),
        body: GetBuilder<ImpitemdetailsController>(
            builder: (c) => HandlingDataView(
                  statusRequest: c.statusRequest,
                  widget: SafeArea(
                    child: Container(
                        child: ListView(
                      children: [
                        const Customimage(),
                        SizedBox(
                          height: size.height * 0.20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTitle(),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              const CustomPriceCounter(),
                              Text(
                                "${databaseTranslate(controller.itemmodel!.itemsDecriptiomAr, controller.itemmodel!.itemsDescriptiom)}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: size.height * 0.035,
                              ),
                              Text(
                                "53".tr,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.0125,
                              ),
                              const CustomBoxsColor()
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                )));
  }
}
