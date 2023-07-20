import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../constant/services/services.dart';

class myMiddlware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myservises = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservises.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    } else if (myservises.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homemain);
    }
    return null;
  }
}
