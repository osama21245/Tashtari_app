// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/signup_data.dart';

abstract class SignupController extends GetxController {
  signup();
  gotohome();
  gotologin();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  late StatusRequest statusRequest;
  SignupData signupdata = SignupData(Get.find());
}

class ImpsignupController extends SignupController {
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool showpassword = true;

  changepass() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  gotohome() {
    Get.offNamed(AppRoutes.homemain);
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupdata.postdata(
        username.text, email.text, password.text, phone.text);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.signupverifyCode, arguments: {"o": email.text});

        // items.addAll(response["items"]);
        // categories.addAll(response["categories"]);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Phone or Email is alredy Exist");
      }
    }
    update();
  }

  @override
  signup() {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      getData();

      print("Vaild");
    } else {
      print("not valid");
    }
  }

  @override
  gotologin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
