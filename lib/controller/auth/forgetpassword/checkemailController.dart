// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/data/datasource/remote/checkemail_data.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/function/handlingdata.dart';

abstract class CheckemailController extends GetxController {
  checkemail();
  List data = [];
  // String id = "";
  late TextEditingController email;
  CheckemailData checkemailData = CheckemailData(Get.find());
  late StatusRequest statusRequest;
}

class ImpcheckemailController extends CheckemailController {
  @override
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkemailData.getData(email.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
        postData(data[0]["users_id"]);
      } else {
        Get.defaultDialog(title: "Warning", middleText: " Email is not Exist");
      }
    }
    update();
  }

  postData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkemailData.postData(email.text, id);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.verifyCode,
            arguments: {"e": email.text, "o": id});
      } else {
        Get.defaultDialog(title: "Warning", middleText: " Email is not Exist");
      }
    }
    update();
  }

  checkemail() {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      getData();
    } else {}
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
