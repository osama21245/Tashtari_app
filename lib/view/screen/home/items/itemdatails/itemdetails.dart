import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/view/widget/homeMain/item/itemdetails/customBoxsColor.dart';
import 'package:woocommerce_app/view/widget/homeMain/item/itemdetails/customPrice&Counter.dart';
import 'package:woocommerce_app/view/widget/homeMain/item/itemdetails/customTitle.dart';

import '../../../../../core/function/databaseTranslate.dart';
import '../../../../widget/homeMain/item/itemdetails/customImage.dart';
import '../../../../widget/homeMain/item/itemdetails/custombuttomNavigationbar.dart';

class itemdetails extends GetView<ImpitemdetailsController> {
  itemdetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentstate;
    Size size = MediaQuery.of(context).size;
    Get.put(ImpitemdetailsController());
    int? state = 0;
    return Scaffold(
      bottomNavigationBar: CustombuttomNavigationbar(),
      backgroundColor: Color.fromARGB(251, 255, 255, 255),
      body: SafeArea(
        child: Container(
            child: ListView(
          children: [
            Customimage(),
            SizedBox(
              height: size.height * 0.20,
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomPriceCounter(),
                  Text(
                    "${databaseTranslate(controller.itemmodel!.itemsDecriptiomAr, controller.itemmodel!.itemsDescriptiom)}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.0125,
                  ),
                  CustomBoxsColor()
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
