import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/services/services.dart';
import '../core/function/databaseTranslate.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/favourite_data.dart';
import 'package:flutter/material.dart';

import '../data/model/favoratemodel.dart';

abstract class favourateController extends GetxController {
  Map isFavorite = {};
  setfavorite(id, val);
  late StatusRequest statusRequest;
  FavoriteData favouritedata = FavoriteData(Get.find());
  MyServices myservices = Get.find();
  List<Favoritemodel> data = [];
  List data2 = [];
  gotofav();
}

class ImpfavourateController extends favourateController {
  @override
  gotofav() {
    Get.toNamed(AppRoutes.favorite);
  }

  setfavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addtofav(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouritedata.add(
        myservices.sharedPreferences.getInt("id").toString(), itemsid);
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
    update();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouritedata.delete(
        myservices.sharedPreferences.getInt("id").toString(), itemsid);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
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
        .view(myservices.sharedPreferences.getInt("id").toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List getdata = response["data"];
        data.addAll(getdata.map((e) => Favoritemodel.fromJson(e)));
        data2.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitemfromFav(String favid) {
    var response = favouritedata.deleteitem(favid);

    data.removeWhere((element) => element.favoriteId == favid);

    Get.rawSnackbar(
        title: "Notfication",
        messageText: const Text("Your item has been deleted from favorite",
            style: TextStyle(color: Colors.white)));

    update();
  }

  @override
  void onInit() {
    viewfav();

    super.onInit();
  }
}
