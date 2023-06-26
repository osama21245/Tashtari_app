import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/model/item_model.dart';
import '../cartController.dart';

class itemdetailsController extends GetxController {
  Itemmodel? itemmodel;
  late StatusRequest statusRequest;
  int? counter2 = 0;
  gotocart() {}
  int? state = 0;
  int? price2;
  CartData cartdata = CartData(Get.find());
  MyServices myservices = Get.find();

  ImpcartController cartcontroller = ImpcartController();

  changeprice(int? price) {}
  counterIncress(String itemsid) {}
  counter0() {}
  changestate(int i) {}
}

class ImpitemdetailsController extends itemdetailsController {
  @override
  gotocart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  changestate(i) {
    state = i;
    update();
  }

  changeprice(price) {
    price2 = (int.parse(itemmodel!.itemsPrice!) * counter2!);
    update();
  }

  counterIncress(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.add(
        myservices.sharedPreferences.getString("id").toString(),
        itemsid.toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            title: "Notfication",
            messageText: const Text(
              "Your item has been add to cart",
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

    counter2 = (counter2! + 1);
    changeprice(int.parse(itemmodel!.itemsPrice!));
    print(price2);

    update();
  }

  itemcountcart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.countitem(
        myservices.sharedPreferences.getString("id").toString(),
        itemmodel!.itemsId.toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      counter2 = int.parse(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  counterdecress(String itemsid) async {
    if (counter2! > 0) {
      statusRequest == StatusRequest.loading;
      update();
      var response = await cartdata.delete(
          myservices.sharedPreferences.getString("id").toString(),
          itemsid.toString());
      print("==================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.rawSnackbar(
              title: "Notfication",
              messageText: const Text("Your item has been deleted from cart",
                  style: TextStyle(color: Colors.white)));
        } else {
          Get.rawSnackbar(
              title: "Notfication",
              messageText: const Text("Error in Connection",
                  style: TextStyle(color: Colors.white)));
          statusRequest = StatusRequest.failure;
        }
      }

      counter2 = (counter2! - 1);

      changeprice(int.parse(itemmodel!.itemspricediscount!));
      print(price2);
    }

    update();
  }

  initialData() async {
    statusRequest = StatusRequest.loading;

    // counter2 = int.parse(await itemcountcart(itemmodel!.itemsId.toString()));
    await itemcountcart();
    changeprice(price2);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    itemmodel = Get.arguments["itemsmodel"];
    price2 = int.parse(itemmodel!.itemspricediscount!);
    print(itemmodel!.itemspricediscount!);
    initialData();
    super.onInit();
  }
}
