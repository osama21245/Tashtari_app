import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/ordersDetails_data.dart';
import '../../data/model/orders_model.dart';

class OrdersdetailsController extends GetxController {
  OrdersModel? ordersModel;
  OrdersDetailsData ordersData = OrdersDetailsData(Get.find());
  StatusRequest? statusRequest;
  List<OrdersModel>? ordersDetailsData = [];
  List? data;
}

class ImpordersdetailsController extends OrdersdetailsController {
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.finddata(ordersModel!.ordersId.toString());
    print("==================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        ordersDetailsData!.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {}
    }
    update();
  }

  void onInit() {
    ordersModel = Get.arguments["details"];

    print(ordersModel!.addressId);

    getData();
    print(data);
    super.onInit();
  }
}
