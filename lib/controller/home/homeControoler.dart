import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';
import 'package:woocommerce_app/view/widget/homeMain/item/customCategoriesitem.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/home_data.dart';
import '../../view/screen/home/items/itempage.dart';

abstract class homePageControoler extends GetxController {
  StatusRequest? statusRequest;
  List items = [];
  List categories = [];
  getData();
  gotoitem(List categories, int selectedkat, String catid);
  HomeData homeData = HomeData(Get.find());
  String? langselected;
  MyServices myservices = Get.find();
  String? phone;
  String? email;
  String? name;
  int? id;
}

class ImphomePageControoler extends homePageControoler {
  @override
  gotoitem(categories, selectedkat, catid) {
    Get.toNamed(AppRoutes.itemmain, arguments: {
      "categories": categories,
      "selectedkat": selectedkat,
      "catid": catid
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        items.addAll(response["items"]);
        categories.addAll(response["categories"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    id = myservices.sharedPreferences.getInt("id");
    email = myservices.sharedPreferences.getString("email");
    name = myservices.sharedPreferences.getString("name");
    phone = myservices.sharedPreferences.getString("phone");
    print(id);
    getData();
    langselected = myservices.sharedPreferences.getString("lang");

    super.onInit();
  }
}
