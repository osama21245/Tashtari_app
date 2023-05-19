import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';

import '../core/function/handlingdata.dart';
import '../data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statuesRequest;

  getData() async {
    statuesRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("==================$response");
    statuesRequest = handlingData(response);
    if (statuesRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statuesRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
