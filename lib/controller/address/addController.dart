import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/address_data.dart';

abstract class AddressAddController extends GetxController {
  late TextEditingController addressname;
  late TextEditingController addressStreet;
  late TextEditingController addresscity;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  MyServices myservices = Get.find();
}

class ImpadressAddController extends AddressAddController {
  add() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=======");
    var response = await addressData.add(
        myservices.sharedPreferences.getString("id").toString(),
        addressname.text,
        addresscity.text,
        addressStreet.text);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homemain);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Requiest is Faild");
      }
    }
    update();
  }

  // ignore: non_constant_identifier_names
  AddCompleted() {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      add();
    } else {}
  }

  @override
  void onInit() {
    addressname = TextEditingController();
    addressStreet = TextEditingController();
    addresscity = TextEditingController();
    statusRequest = StatusRequest.success;

    super.onInit();
  }
}
