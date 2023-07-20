import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';

import '../core/constant/color.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/coupon_model.dart';
import '../data/model/cart_model.dart';

abstract class CartController extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;
  CartData cartdata = CartData(Get.find());
  MyServices myservices = Get.find();
  List<CartModel> cartViewitems = [];
  // List<couponModel> coupondata = [];
  couponModel? couponmodel;
  String? couponname;
  int discountAmount = 0;
  double? totalpriceOfitem;
  int? totalcount;
  int? itemdiscountprice;
  int? couponid;
  double finalprice = 0.0;
  // int? itemcount;
  refreshpage() {}
  resetData() {}
  initialData() {}
  TextEditingController? coponcode;
}

class ImpcartController extends CartController {
  gotocheckout() {
    if (cartViewitems.isEmpty) return Get.snackbar("!", "No items in cart");
    Get.offNamed(AppRoutes.checkout, arguments: {
      "couponid": couponid ?? 0,
      "finalprice": finalprice,
      "totalitemsPrice": totalpriceOfitem
    });
  }

  addtocart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.add(
        myservices.sharedPreferences.getString("id").toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "81".tr,
            messageText: Text(
              "82".tr,
              style: TextStyle(color: Colors.white),
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

  deletefromcart(String itemsid) async {
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
            messageText: Text("86".tr, style: TextStyle(color: Colors.white)));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkcoupon() async {
    statusRequest == StatusRequest.loading;
    update();
    var response = await cartdata.checkcoupon(coponcode!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Map<String, dynamic> data = response["data"];
        couponmodel = couponModel.fromJson(data);
        discountAmount = int.parse(couponmodel!.couponDiscount!);
        finalprice =
            (totalpriceOfitem! - totalpriceOfitem! * discountAmount / 100);
        couponname = couponmodel!.couponName;
        couponid = int.parse(couponmodel!.couponId!);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Coupon is not correct",
          onConfirm: () {
            Get.back();
          },
          buttonColor: AppColor.primaryColor,
          confirmTextColor: Colors.white,
          textConfirm: "ok",
        );
        couponid = null;
        discountAmount = 0;
        finalprice =
            (totalpriceOfitem! - totalpriceOfitem! * discountAmount / 100);
        couponname = null;
      }
    }
    update();
  }

  @override
  resetData() {
    totalpriceOfitem = 0.0;
    totalcount = 0;
    cartViewitems.clear();
  }

  @override
  refreshpage() {
    resetData();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata
        .view(myservices.sharedPreferences.getString("id").toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        if (response["datacart"]["status"] == "success") {
          cartViewitems.clear();
          List dataresponse = response['datacart']["data"];
          Map dataresponsecount = response['countprice'];

          cartViewitems.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcount = int.parse(dataresponsecount["totalcount"]);
          int reversetoduble = int.parse(dataresponsecount["totalprice"]);
          itemdiscountprice = dataresponsecount["itemspricediscount"];
          totalpriceOfitem = reversetoduble.toDouble();

          finalprice =
              (totalpriceOfitem! - totalpriceOfitem! * discountAmount / 100);
        } else {
          totalpriceOfitem = 0;
          totalcount = 0;
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  initialData() {
    view();
  }

  @override
  void onInit() {
    statusRequest == StatusRequest.success;
    initialData();
    coponcode = TextEditingController();
    super.onInit();
  }
}
