import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/services/services.dart';

class ThemeSrevice {
  MyServices myServices = Get.find();

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
  );

  final _darkThemeKey = "isDarkMode";

  void saveThemeData(bool isDarkMode) {
    myServices.sharedPreferences
        .setBool("isDarkMode", _darkThemeKey == "isDarkMode" ? true : false);
  }

  bool isSavedDarkMode() {
    return myServices.sharedPreferences.getBool("isDarkMode") == true
        ? true
        : false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    isSavedDarkMode() == true
        ? myServices.sharedPreferences.setBool("isDarkMode", false)
        : myServices.sharedPreferences.setBool("isDarkMode", true);
  }
}
