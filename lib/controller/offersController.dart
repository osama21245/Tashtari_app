import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';

import '../core/constant/routesname.dart';
import '../core/constant/services/services.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/offers_data.dart';
import '../data/model/item_model.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  Itemmodel? itemsmodel;
  List<Itemmodel> data = [];
  MyServices myservices = Get.find();
  int? delevirytime = 0;

  late StatusRequest statuesRequest;
}

class ImpoffersController extends OffersController {
  getData() async {
    statuesRequest = StatusRequest.loading;
    var response = await offersData
        .getData(myservices.sharedPreferences.getString("id").toString());
    statuesRequest = handlingData(response);
    if (statuesRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data2 = response["data"];
        data.addAll(data2.map((e) => Itemmodel.fromJson(e)));
      } else {
        statuesRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoitemdetails(itemsmodel) {
    Get.toNamed(AppRoutes.itemdetails, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  void onInit() {
    getData();
    delevirytime = myservices.sharedPreferences.getInt("deliverytime");

    super.onInit();
  }
}
