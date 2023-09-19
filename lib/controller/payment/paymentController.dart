import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/payment_data.dart';

abstract class paymentControler extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late StatusRequest statusRequest;
  String apikey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RZME16Z3lMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuODhHZ2F5aTZlN09HT2VRV1VXb0xRNjRSci1UbUZ5Q0x3dkIxM1NaTS16QWY4LXBpVTM3Y3dERmRDbUk4M09rUlJaMERsWXEzZm9LcC1HZVFzSVY0eWc=";
  PaymentData paymentdata = PaymentData(Get.find());
  String token = '';
  String finaltoken = "";
  String orderPaymentid = "";
  String refid = "";
  int integrationid = 4053708;
  String kioskRef = "";
  String visaUrl =
      'https://accept.paymob.com/api/acceptance/iframes/776442?payment_token={payment_key_obtained_previously}';
}

class ImppaymentController extends paymentControler {
  gettoken() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await paymentdata.getauthtoken(apikey);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["token"] != "") {
        token = response['token'];
        print(token);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
    update();
  }

  getid() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await paymentdata.getid(token);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["id"] != "") {
        orderPaymentid = response['id'].toString();
        print("=================1");
        payment();
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Erorr at connect");
      }
    }
    update();
  }

  payment() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await paymentdata.getpayment(orderPaymentid, token, integrationid);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["token"] != "") {
        finaltoken = response['token'];
        visaUrl =
            "https://accept.paymob.com/api/acceptance/iframes/776441?payment_token=$finaltoken&amount_cents=500000";
        print(finaltoken);

        Get.toNamed(AppRoutes.visa);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
    update();
  }

  kiosk() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await paymentdata.kioskpayment(token);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        kioskRef = response['id'];
        Get.toNamed(AppRoutes.refcode);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
    update();
  }

  orderStatus() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await paymentdata.orderStatment(visaUrl);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        kioskRef = response['id'];
        bool success = response['obj']['success'];
        print(success);

        Get.toNamed(AppRoutes.Toggel);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
    update();
  }

  @override
  void onInit() {
    // firstNameController.text =
    //     myservices.sharedPreferences.getString("users_name")!;
    // emailController.text =
    //     myservices.sharedPreferences.getString("users_email")!;
    // phoneController.text =
    //     myservices.sharedPreferences.getString("users_phone")!;
    gettoken();
    super.onInit();
  }
}
