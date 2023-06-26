import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/screen/home/homepage.dart';

import '../../offers.dart';
import '../../settings.dart';

abstract class homePageMainController extends GetxController {
  changePage(int currentpage);
}

class ImphomePageMainController extends homePageMainController {
  int currentpage = 0;

  List<Widget> listpage = [
    const Home(),
    Settings(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "28".tr,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    ),
    Offers()
  ];
  List titlebottomappbar = ["27".tr, "28".tr, "Notfication".tr, "Offers"];

  List<IconData> iconbottomappbar = [
    Icons.home_outlined,
    Icons.perm_data_setting_outlined,
    Icons.notifications_on_outlined,
    Icons.local_offer_outlined
  ];

  changePage(int i) {
    currentpage = i;

    update();
  }
}
