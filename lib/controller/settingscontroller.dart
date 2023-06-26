import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../core/constant/services/services.dart';
import '../core/constant/services/theme.dart';

class settingsController extends GetxController {
  logout() {}
  MyServices myServices = Get.find();
}

class ImpsettingsController extends settingsController {
  logout() {
    String? userid = myservices.sharedPreferences.getString("id");
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  changetheme() {
    ;
    update();
  }

  checkvalue() {
    ThemeSrevice().isSavedDarkMode() == true ? true : false;
  }
}
