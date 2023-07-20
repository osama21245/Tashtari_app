import 'package:get/get.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';

import '../core/constant/routesname.dart';
import '../core/constant/services/services.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/checkout_data.dart';
import '../data/model/address_model.dart';

class CheckoutController extends GetxController {
  String paymentval = "";

  String deliveryval = "";
  String addressval = "0";
  List<AddressModel> dataAdress = [];

  late int couponid;
  late double finalprice;

  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutdata = CheckoutData(Get.find());
  MyServices myservices = Get.find();
  int? F_valpayment;
  int? F_valdelivery;
  late double priceBeforediscount;
}

class ImpcheckoutController extends CheckoutController {
  getpaymetval(String val) {
    paymentval = val;
    update();
  }

  getdeliveryval(String val) {
    deliveryval = val;
    update();
  }

  getaddressval(String val) {
    addressval = val;

    update();
  }

  checkout() async {
    if (paymentval == "cash") {
      F_valpayment = 0;
    } else {
      F_valpayment = 1;
    }
    if (deliveryval == "delivery") {
      F_valdelivery = 0;
    } else {
      F_valdelivery = 1;
    }

    if (paymentval == "") {
      return Get.defaultDialog(
          title: "Warning", middleText: "Please enter payment details");
    }
    if (deliveryval == "") {
      return Get.defaultDialog(
          title: "Warning", middleText: "Please enter delivery details");
    }
    if (F_valdelivery == 0) {
      if (addressval == "" || addressval == "0") {
        return Get.defaultDialog(
            title: "Warning", middleText: "Please enter address details");
      }
    }

    statusRequest = StatusRequest.loading;
    update();
    print("=======");
    var response = await checkoutdata.getData(
        myservices.sharedPreferences.getString("id").toString(),
        addressval,
        F_valpayment.toString(),
        F_valdelivery.toString(),
        "10",
        finalprice.toString(),
        couponid.toString(),
        priceBeforediscount.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homemain);
        Get.snackbar("!", "Your order has been added");
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Faild to Reach to your order");
      }
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=======");
    var response = await addressData.view(
      myservices.sharedPreferences.getString("id").toString(),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        dataAdress.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Faild to Reach to your address");
      }
    }
    update();
  }

  @override
  void onInit() {
    priceBeforediscount = Get.arguments["totalitemsPrice"];
    couponid = Get.arguments["couponid"];
    finalprice = Get.arguments["finalprice"];
    view();
    super.onInit();
  }
}
