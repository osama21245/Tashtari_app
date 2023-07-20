import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/screen/home/homepage.dart';

import '../../notifications.dart';
import '../../offers.dart';
import '../../settings.dart';

// ignore: camel_case_types
abstract class homePageMainController extends GetxController {
  changePage(int currentpage);
}

class ImphomePageMainController extends homePageMainController {
  int currentpage = 0;

  List<Widget> listpage = [
    const Home(),
    const Settings(),
    const Notifications(),
    const Offers()
  ];
  List titlebottomappbar = ["27".tr, "28".tr, "50".tr, "51".tr];

  List<IconData> iconbottomappbar = [
    Icons.home_outlined,
    Icons.perm_data_setting_outlined,
    Icons.notifications_on_outlined,
    Icons.local_offer_outlined
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentpage = i;

    update();
  }
}
