import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/localization/changelocal.dart';
import 'package:woocommerce_app/core/constant/localization/translation.dart';
import 'package:woocommerce_app/routes.dart';
import 'package:woocommerce_app/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:woocommerce_app/view/screen/auth/logIn.dart';
import 'package:woocommerce_app/view/screen/auth/signup.dart';
import 'package:woocommerce_app/view/screen/home/homepaemain.dart';
import 'package:woocommerce_app/view/screen/home/items/itemdatails/itemdetails.dart';

import 'package:woocommerce_app/view/screen/language.dart';

import 'binding/initialbinding.dart';
import 'core/constant/color.dart';
import 'core/constant/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyText1:
                TextStyle(height: 2, color: AppColor.grey, fontSize: 18)),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
