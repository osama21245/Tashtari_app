// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/data/datasource/remote/checkemail_data.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/function/handlingdata.dart';

abstract class checkemailController extends GetxController {
  checkemail();
  late TextEditingController email;
  CheckemailData checkemailData = CheckemailData(Get.find());
  late StatusRequest statusRequest;
}

class ImpcheckemailController extends checkemailController {
  @override
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkemailData.getData(
      email.text,
    );
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.verifyCode, arguments: {"e": email.text});

        // items.addAll(response["items"]);
        // categories.addAll(response["categories"]);
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

      print("Vaild");
    } else {
      print("not valid");
    }
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
