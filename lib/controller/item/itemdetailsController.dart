import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/datasource/remote/itemdetais_data.dart';
import '../../data/model/item_model.dart';
import '../../data/model/itemsReview_model.dart';
import '../cartController.dart';

class ItemdetailsController extends GetxController {
  Itemmodel? itemmodel;
  late StatusRequest statusRequest;
  int? counter2 = 0;
  gotocart() {}
  int? state = 0;
  int? price2;
  bool isloading = false;
  CartData cartdata = CartData(Get.find());
  ItemsReviewModel? itemsReviewModel;
  List<ItemsReviewModel> reviews = [];
  MyServices myservices = Get.find();
  itemDetailsData itemdetaisData = itemDetailsData(Get.find());
  TextEditingController? comment;
  String? Rating;
  ImpcartController cartcontroller = ImpcartController();

  changeprice(int? price) {}
  counterIncress(String itemsid) {}
  counter0() {}
  changestate(int i) {}
}

class ImpitemdetailsController extends ItemdetailsController {
  @override
  gotocart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  changestate(i) {
    state = i;
    update();
  }

  @override
  changeprice(price) {
    price2 = (int.parse(itemmodel!.itemsPrice!) * counter2!);
    update();
  }

  @override
  counterIncress(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.add(
        myservices.sharedPreferences.getString("id").toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        gotocart();

        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "81".tr,
            messageText: Text(
              "82".tr,
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

    counter2 = (counter2! + 1);
    changeprice(int.parse(itemmodel!.itemsPrice!));

    update();
  }

  itemcountcart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.countitem(
        myservices.sharedPreferences.getString("id").toString(),
        itemmodel!.itemsId.toString());
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
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.rawSnackbar(
              duration: const Duration(seconds: 1),
              title: "81".tr,
              messageText:
                  Text("83".tr, style: const TextStyle(color: Colors.white)));
        } else {
          Get.rawSnackbar(
              title: "81".tr,
              messageText:
                  Text("86".tr, style: const TextStyle(color: Colors.white)));
          statusRequest = StatusRequest.failure;
        }
      }

      counter2 = (counter2! - 1);

      changeprice(int.parse(itemmodel!.itemspricediscount!));
    }

    update();
  }

  showreviews() async {
    reviews.clear();
    update();
    var response = await itemdetaisData.getreviews(
      itemmodel!.itemsId.toString(),
      myservices.sharedPreferences.getString("id").toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    print(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['data'];
      reviews.addAll(data.map((e) => ItemsReviewModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  rateItem() async {
    isloading = true;
    update();
    var response = await itemdetaisData.addreviews(
        itemmodel!.itemsId.toString(),
        myservices.sharedPreferences.getString("id").toString(),
        comment!.text,
        Rating == null ? "0" : Rating!);
    print(response);
    statusRequest = handlingData(response);
    print(response);
    if (statusRequest == StatusRequest.success) {
      showreviews();
    } else {
      statusRequest = StatusRequest.failure;
    }
    isloading = false;
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
    // print(reviews[0].reviewComment);
    itemmodel = Get.arguments["itemsmodel"];
    price2 = int.parse(itemmodel!.itemspricediscount!);
    comment = TextEditingController();
    initialData();
    showreviews();

    super.onInit();
  }
}
