import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../core/constant/services/services.dart';

class settingsController extends GetxController {
  logout() {}
  MyServices myServices = Get.find();
}

class ImpsettingsController extends settingsController {
  logout() {
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
