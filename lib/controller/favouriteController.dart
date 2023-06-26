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

abstract class favourateController extends GetxController {
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

class ImpfavourateController extends favourateController {
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
    print("==================$response");
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

  refreshpage() {
    resetData();
    viewfav();
  }

  gotofav() {
    Get.toNamed(AppRoutes.favorite);
  }

  setfavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addtofav(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouritedata.add(
        myservices.sharedPreferences.getString("id").toString(), itemsid);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text(
              "Your item has been add to favorite",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text("Error in Connection",
                style: TextStyle(color: Colors.white)));
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
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.clear();
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text("Your item has been deleted from favorite",
                style: TextStyle(color: Colors.white)));
      } else {
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text("Error in Connection",
                style: TextStyle(color: Colors.white)));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewfav() async {
    statusRequest = StatusRequest.loading;
    var response = await favouritedata
        .view(myservices.sharedPreferences.getString("id").toString());
    print("==================$response");
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
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.clear();
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text("Your item has been deleted from favorite",
                style: TextStyle(color: Colors.white)));
      } else {
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text("Error in Connection",
                style: TextStyle(color: Colors.white)));
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
