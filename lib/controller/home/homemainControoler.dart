import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/screen/home/homepage.dart';

import '../../settings.dart';

abstract class homePageMainController extends GetxController {
  changePage(int currentpage);
}

class ImphomePageMainController extends homePageMainController {
  @override
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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "30".tr,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    )
  ];
  List titlebottomappbar = ["27".tr, "28".tr, "29".tr, "30".tr];

  List<IconData> iconbottomappbar = [
    Icons.home,
    Icons.settings,
    Icons.man,
    Icons.favorite
  ];

  changePage(int i) {
    currentpage = i;

    update();
  }
}
