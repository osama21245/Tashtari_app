import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/home_data.dart';
import '../../data/datasource/remote/item_data.dart';
import '../../data/model/item_model.dart';

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
  String? id;
  int? delevirytime;
  List<Itemmodel> searchlist = [];
  bool issearch = false;
  TextEditingController? search2;
  checkSearch(String val);
  HomeData homeData = HomeData(Get.find());
}

class ImpitemControoler extends itemControoler {
  checkSearch(String val) {
    if (val == "") {
      issearch = false;
      statusRequest = StatusRequest.success;
      searchlist.clear();
    }
    update();
  }

  onsearchitems() {
    issearch = true;
    update();
  }

  search() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.search(search2!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        searchlist.clear();
        List searchresponse = response["data"];
        searchlist.addAll(searchresponse.map((e) => Itemmodel.fromJson(e))
            as Iterable<Itemmodel>);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getData(categoriesid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itmedata.getData(
        categoriesid, myservices.sharedPreferences.getString("id").toString());
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
    search2 = TextEditingController();
    id = myservices.sharedPreferences.getString("id");
    delevirytime = myservices.sharedPreferences.getInt("deliverytime");
    print(id);
    initialData();
    super.onInit();
  }
}
