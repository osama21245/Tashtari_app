import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/home_data.dart';
import '../../data/datasource/remote/notification_data.dart';
import '../../data/model/item_model.dart';

abstract class homePageControoler extends GetxController {
  StatusRequest? statusRequest;
  List<Itemmodel> searchlist = [];
  List items = [];
  List categories = [];
  List settings = [];
  String settingTitle = "";
  String settingsbody = "";
  int settingsDeliveryTime = 0;
  bool issearch = false;
  TextEditingController? search2;
  checkSearch(String val);
  getData();
  gotoitem(List categories, int selectedkat, String catid);
  HomeData homeData = HomeData(Get.find());
  NotificatinData notificatinData = NotificatinData(Get.find());
  List notifications = [];
  String? langselected;
  MyServices myservices = Get.find();
  String? phone;
  String? email;
  String? name;

  String? id;
}

class ImphomePageControoler extends homePageControoler {
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

  @override
  gotoitem(categories, selectedkat, catid) {
    Get.toNamed(AppRoutes.itemmain, arguments: {
      "categories": categories,
      "selectedkat": selectedkat,
      "catid": catid
    });
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["items"]["data"];
        items.addAll(data.map((e) => Itemmodel.fromJson(e)));
        categories.addAll(response["categories"]["data"]);
        settings.addAll(response["settings"]["data"]);
        settingTitle = settings[0]["settings_title"];
        settingsbody = settings[0]["settings_body"];
        settingsDeliveryTime = int.parse(settings[0]["settings_deliverytime"]);
        myservices.sharedPreferences
            .setInt("deliverytime", settingsDeliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // getNotficationData() async {
  //   notifications.clear();
  //   print(myservices.sharedPreferences.getString("id"));
  //   statusRequest = StatusRequest.loading;
  //   var response = await notificatinData
  //       .getData(myservices.sharedPreferences.getString("id"));
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response["status"] == "success") {
  //       notifications = response["data"];
  //       await FlutterAppBadger.updateBadgeCount(5);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

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
  void onInit() {
    search2 = TextEditingController();
    id = myservices.sharedPreferences.getString("id");
    email = myservices.sharedPreferences.getString("email");
    name = myservices.sharedPreferences.getString("name");
    phone = myservices.sharedPreferences.getString("phone");
    String? userid = myservices.sharedPreferences.getString("id");
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users${userid}");
    // getNotficationData();
    print(id);
    getData();
    langselected = myservices.sharedPreferences.getString("lang");
    super.onInit();
  }
}
