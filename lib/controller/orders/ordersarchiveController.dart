import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/archive_data.dart';
import '../../data/model/orders_model.dart';

class OrderArchiveController extends GetxController {
  StatusRequest? statusRequest;
  ArchiveData ordersdata = ArchiveData(Get.find());
  List<OrdersModel> orderslist = [];

  MyServices myservices = Get.find();
}

class ImporderArchiveController extends OrderArchiveController {
  // ignore: non_constant_identifier_names
  String ReturnorderStatus(String order) {
    if (order == "0") {
      return "Await Approval";
    } else if (order == "1") {
      return "Prepare";
    } else if (order == "2") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata
        .getData(myservices.sharedPreferences.getString("id").toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        orderslist.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {}
    }
    update();
  }

  rating(String ordersid, String rating, String note) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.rating(ordersid, rating, note);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
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
