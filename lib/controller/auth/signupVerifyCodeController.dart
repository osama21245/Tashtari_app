import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/verifyCode_data.dart';

abstract class signupVerifycodeController extends GetxController {
  checkcode();
  StatusRequest? statusRequest = StatusRequest.success;
  gotoSuccesSignUp();
  String? email;
  VerifycodeData verifycodeData = VerifycodeData(Get.find());
}

class ImpsignupVerifycodeController extends signupVerifycodeController {
  late String verifycode;

  @override
  checkcode() {}

  @override
  gotoSuccesSignUp() {
    Get.offNamed(
      AppRoutes.sucsessSignup,
    );
  }

  getData(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.SendverifyCode(
      verifycode,
      email!,
    );
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        gotoSuccesSignUp();
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "VerifyCode is not correct");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["o"];

    // Get.defaultDialog(
    //     title: "Done", middleText: "Your email has been created active it");

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
