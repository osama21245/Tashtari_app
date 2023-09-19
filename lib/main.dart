import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/localization/changelocal.dart';
import 'package:woocommerce_app/core/constant/localization/translation.dart';
import 'package:woocommerce_app/routes.dart';

import 'binding/initialbinding.dart';
//import 'core/constant/color.dart';
import 'core/constant/services/services.dart';
import 'core/constant/services/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Future.delayed(const Duration(milliseconds: 1200))
        .then((value) => FlutterNativeSplash.remove());
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    // MyServices myServices = Get.find();
    return GetMaterialApp(
      theme: ThemeSrevice().lightTheme,
      darkTheme: ThemeSrevice().darkTheme,
      themeMode: ThemeSrevice().getThemeMode(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Tashtari',
      locale: controller.language,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
