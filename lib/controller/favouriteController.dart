import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/services/services.dart';
import '../core/function/databaseTranslate.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/favourite_data.dart';
import 'package:flutter/material.dart';

import '../data/datasource/remote/home_data.dart';
import '../data/model/favorate_model.dart';
import '../data/model/item_model.dart';

abstract class FavourateController extends GetxController {
  Map isFavorite = {};
  setfavorite(id, val);
  late StatusRequest statusRequest;
  FavoriteData favouritedata = FavoriteData(Get.find());
  MyServices myservices = Get.find();
  List<Favoritemodel> data = [];
  List<Itemmodel> searchlist = [];
  bool issearch = false;
  TextEditingController? search2;
  checkSearch(String val);
  HomeData homeData = HomeData(Get.find());

  refreshpage() {}
  gotofav();
  resetData() {}
}

class ImpfavourateController extends FavourateController {
  @override
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

  gotoitemdetails(itemsmodel) {
    Get.toNamed(AppRoutes.itemdetails, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  resetData() {
    data.clear();
  }

  @override
  refreshpage() {
    resetData();
    viewfav();
  }

  @override
  gotofav() {
    Get.toNamed(AppRoutes.favorite);
  }

  @override
  setfavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addtofav(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouritedata.add(
        myservices.sharedPreferences.getString("id").toString(), itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "81".tr,
            messageText: Text(
              "84".tr,
              style: const TextStyle(color: Colors.white),
            ));
      } else {
        Get.rawSnackbar(
            title: "81".tr,
            messageText:
                Text("86".tr, style: const TextStyle(color: Colors.white)));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefromfav(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouritedata.delete(
        myservices.sharedPreferences.getString("id").toString(), itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.clear();
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "81".tr,
            messageText:
                Text("85".tr, style: const TextStyle(color: Colors.white)));
      } else {
        Get.rawSnackbar(
            title: "81".tr,
            messageText:
                Text("86".tr, style: const TextStyle(color: Colors.white)));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewfav() async {
    statusRequest = StatusRequest.loading;
    var response = await favouritedata
        .view(myservices.sharedPreferences.getString("id").toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.clear();

        List getdata = response["data"];
        data.addAll(getdata.map((e) => Favoritemodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitemfromFav(String favid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouritedata.deleteitem(favid.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.clear();
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "81".tr,
            messageText:
                Text("85".tr, style: const TextStyle(color: Colors.white)));
      } else {
        Get.rawSnackbar(
            title: "81".tr,
            messageText:
                Text("86".tr, style: const TextStyle(color: Colors.white)));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewfav();
    search2 = TextEditingController();

    super.onInit();
  }
}
