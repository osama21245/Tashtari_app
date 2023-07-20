import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../../data/datasource/remote/verifyCode_data.dart';

abstract class VerifycodeController extends GetxController {
  checkcode();
  StatusRequest? statusRequest = StatusRequest.success;

  VerifycodeData verifycodeData = VerifycodeData(Get.find());
  gotoresetpassword();
  String? email;
  String? id;
}

class ImpverifycodeController extends VerifycodeController {
  late String verifycode;

  @override
  checkcode() {}

  @override
  gotoresetpassword() {
    Get.offNamed(AppRoutes.resetPassword, arguments: {"e": email});
  }

  getData(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.Sendforcheckemail(
      verifycode,
      id!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        gotoresetpassword();
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "VerifyCode is not correct");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["e"];
    id = Get.arguments["o"];
    print(id);

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
