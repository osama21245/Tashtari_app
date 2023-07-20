// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../../data/datasource/remote/resetpassword_data.dart';

abstract class resetpasswordController extends GetxController {
  // ignore: non_constant_identifier_names
  ResetPassword();
  changepass2();
  late TextEditingController password;
  late TextEditingController repassword;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  late StatusRequest statusRequest;
  String? email;
  bool showpassword = true;
  bool showpassword2 = true;
}

class ImpresetpasswordController extends resetpasswordController {
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  changepass() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  @override
  changepass2() {
    showpassword2 = showpassword2 == true ? false : true;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetpasswordData.getData(email!, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(
          AppRoutes.sucsessresetPassword,
        );

        // items.addAll(response["items"]);
        // categories.addAll(response["categories"]);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Try Again");
      }
    }
    update();
  }

  @override
  ResetPassword() {
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
    email = Get.arguments["e"];
    password = TextEditingController();
    repassword = TextEditingController();
    statusRequest = StatusRequest.success;

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
