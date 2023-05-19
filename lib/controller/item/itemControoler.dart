import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/item_data.dart';
import '../../data/model/itemmodel.dart';

abstract class itemControoler extends GetxController {
  initialData();
  changekat(int val, String newCatid);
  gotoitemdetails(Itemmodel itemsmodel);
  List items = [];
  getData(String categoriesid);
  itemData itmedata = itemData(Get.find());
  late StatusRequest statusRequest;
  String? langSelected;
  MyServices myservices = Get.find();
  Itemmodel? itemsmodel;
  int? id;
}

class ImpitemControoler extends itemControoler {
  @override
  getData(categoriesid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itmedata.getData(
        categoriesid, myservices.sharedPreferences.getInt("id").toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoitemdetails(itemsmodel) {
    Get.toNamed(AppRoutes.itemdetails, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  dynamic kategorie;
  List categories = [];
  int? selectedkat;
  String? catid;

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedkat = Get.arguments["selectedkat"];
    catid = Get.arguments["catid"];
    getData(catid!);
    langSelected = myservices.sharedPreferences.getString("lang");
  }

  @override
  changecatid(String id) {
    catid = id;
    update();
  }

  @override
  changekat(val, newCatid) {
    selectedkat = val;
    catid = newCatid;
    getData(catid!);
    update();
  }

  @override
  void onInit() {
    id = myservices.sharedPreferences.getInt("id");
    print(id);
    initialData();
    super.onInit();
  }
}
