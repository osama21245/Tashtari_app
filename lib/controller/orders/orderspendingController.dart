import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/orders_data.dart';
import '../../data/model/orders_model.dart';

class orderspendingController extends GetxController {
  StatusRequest? statusRequest;
  OrdersData ordersdata = OrdersData(Get.find());
  List<OrdersModel> orderslist = [];

  MyServices myservices = Get.find();
}

class ImporderspendingController extends orderspendingController {
  String ReturnorderStatus(String order) {
    if (order == "0")
      return "Await Approval";
    else if (order == "1")
      return "Prepare";
    else if (order == "2")
      return "On the way";
    else {
      return "Archive";
    }
  }

  resetData() {
    orderslist.clear();
    update();
  }

  refreshpage() {
    resetData();
    getData();
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata
        .getData(myservices.sharedPreferences.getString("id").toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        orderslist.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {}
    }
    update();
  }

  delteData(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.deleteData(orderid);
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        orderslist.clear();
        orderslist.removeWhere((element) => element.ordersId == orderid);
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
