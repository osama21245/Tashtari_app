import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../core/constant/services/services.dart';
import '../core/constant/services/theme.dart';

class SettingsController extends GetxController {
  logout() {}
  MyServices myServices = Get.find();
}

class ImpsettingsController extends SettingsController {
  @override
  logout() {
    String? userid = myservices.sharedPreferences.getString("id");
    String? lang = myservices.sharedPreferences.getString("lang");
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myservices.sharedPreferences.clear();
    myservices.sharedPreferences.setString("lang", lang!);
    myservices.sharedPreferences.setString("step", "1");
    print(lang);
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
