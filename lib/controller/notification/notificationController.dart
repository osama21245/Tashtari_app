import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/notification_data.dart';

abstract class Notificaioncontroller extends GetxController {
  StatusRequest? statusRequest;
  List notifications = [];
  NotificatinData notificatinData = NotificatinData(Get.find());
  MyServices myServices = Get.find();
}

class Impnotificaioncontroller extends Notificaioncontroller {
  getData() async {
    notifications.clear();
    print(myservices.sharedPreferences.getString("id"));
    statusRequest = StatusRequest.loading;
    var response = await notificatinData
        .getData(myservices.sharedPreferences.getString("id"));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        notifications = response["data"];
        await FlutterAppBadger.updateBadgeCount(5);
        await FlutterAppBadger.isAppBadgeSupported();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // deleteData() async {
  //   print(myservices.sharedPreferences.getString("id"));
  //   statusRequest = StatusRequest.loading;
  //   var response = await notificatinData
  //       .deleteData(myservices.sharedPreferences.getString("id"));
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response["status"] == "success") {
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // deleteData();
    super.onClose();
  }
}
