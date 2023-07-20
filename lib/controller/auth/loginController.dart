// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/data/datasource/remote/login_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';

abstract class LoginController extends GetxController {
  login();
  gotosignup();
  gotocheckemail();
  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  LoginData logindata = LoginData(Get.find());
  MyServices myservices = Get.find();
  late GoogleSignInAccount? googleUser;
}

class ImploginController extends LoginController {
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool showpassword = true;

  googlesignin() async {
    await GoogleSignIn().signIn().then((value) {
      googleUser = value;
      // myservices.sharedPreferences.setString("id", googleUser!.id);
      // update();
      // Get.offAllNamed(AppRoutes.homemain);
    });
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  changepass() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logindata.postdata(
      email.text,
      password.text,
    );
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        myservices.sharedPreferences
            .setString("id", response["data"]["users_id"]);
        String? userid = myservices.sharedPreferences.getString("id");
        myservices.sharedPreferences
            .setString("email", response["data"]["users_email"]);
        myservices.sharedPreferences
            .setString("name", response["data"]["users_name"]);
        myservices.sharedPreferences
            .setString("phone", response["data"]["users_phone"]);
        myservices.sharedPreferences.setString("step", "2");
        FirebaseMessaging.instance.subscribeToTopic("users");
        FirebaseMessaging.instance.subscribeToTopic("users${userid}");

        Get.offAllNamed(AppRoutes.homemain);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Password or Email is not correct");
      }
    }
    update();
  }

  @override
  gotocheckemail() {
    Get.offNamed(AppRoutes.checkemail);
  }

  @override
  gotosignup() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  login() {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      getData();
    } else {}
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? Token = value;
    });

    statusRequest = StatusRequest.success;

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
