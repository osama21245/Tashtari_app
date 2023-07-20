import 'package:get/get.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';
import 'package:woocommerce_app/data/model/address_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/address_data.dart';

class AddressViewController extends GetxController {
  List<AddressModel> dataAdress = [];

  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  MyServices myservices = Get.find();
}

class ImpadressViewController extends AddressViewController {
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.view(
      myservices.sharedPreferences.getString("id").toString(),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        dataAdress.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        Get.defaultDialog(title: "Hello", middleText: "Add New Addres");
      }
    }
    update();
  }

  delete(String? addressid) {
    addressData.delete(addressid.toString());
    dataAdress.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
