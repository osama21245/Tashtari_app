import 'package:flutter/material.dart';
import 'package:woocommerce_app/controller/home/homemainControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/view/screen/home/homepage.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/widget/homeMain/CustombottomAppbar.dart';

import '../../widget/homeMain/custombuttomAppbarHome.dart';

class Homemain extends StatelessWidget {
  const Homemain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImphomePageMainController());
    return GetBuilder<ImphomePageMainController>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.secoundColor,
            onPressed: () {},
            child: Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const customBottomAppBarHome(),
          body: controller.listpage.elementAt(controller.currentpage)),
    );
  }
}
