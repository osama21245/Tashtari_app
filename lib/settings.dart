import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import 'controller/settingscontroller.dart';
import 'core/constant/services/theme.dart';
import 'core/function/databaseTranslate.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ImpsettingsController controllerSetting = Get.put(ImpsettingsController());
    ImphomePageControoler controller = Get.put(ImphomePageControoler());
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black26,
              height: Get.width / 2.0,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.name}",
                          style: const TextStyle(
                              fontSize: 30,
                              fontFamily: "PlayfairDisplay",
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text("Welcome",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "PlayfairDisplay",
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor)),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Positioned(
              top: Get.width / 3.4,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 38),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 247, 246, 246),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 247, 246, 246),
                  child: Image.asset(
                    "assets/images/avatar.png",
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: Get.width / 3.8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: Card(
            color: const Color.fromARGB(255, 70, 69, 69),
            child: ListTile(
              trailing: Switch(
                  value: ThemeSrevice().isSavedDarkMode(),
                  onChanged: (value2) {
                    setState(() {
                      ThemeSrevice().changeTheme();
                    });
                  }),
              contentPadding: const EdgeInsets.symmetric(horizontal: 19),
              title: Row(
                children: [
                  Text("63".tr,
                      style: const TextStyle(
                          fontFamily: "PlayfairDisplay", color: Colors.white)),
                  const Icon(Icons.nightlight_outlined, color: Colors.white)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: Card(
            child: ListTile(
              trailing: const Icon(Icons.info_outline),
              contentPadding: const EdgeInsets.symmetric(horizontal: 19),
              title: Text(
                "64".tr,
                style: const TextStyle(fontFamily: "PlayfairDisplay"),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            String? lang = myservices.sharedPreferences.getString("lang");
            lang == "en"
                ? Get.defaultDialog(
                    title: "Warning",
                    middleText:
                        "Are You sure you want to change language to Arabic "
                            .tr,
                    onConfirm: () {
                      myservices.sharedPreferences.setString("lang", "ar");
                      print(lang);
                      exit(0);
                    },
                    onCancel: () {},
                    buttonColor: AppColor.primaryColor,
                    confirmTextColor: Colors.white,
                    cancelTextColor: AppColor.primaryColor,
                    textConfirm: "48".tr,
                    textCancel: "49".tr)
                : Get.defaultDialog(
                    title: "تنبيه",
                    middleText: "هل تريد تغيير اللغه الي اللفه الانجليزيه ".tr,
                    onConfirm: () {
                      myservices.sharedPreferences.setString("lang", "en");
                      print(lang);
                      exit(0);
                    },
                    onCancel: () {},
                    buttonColor: AppColor.primaryColor,
                    confirmTextColor: Colors.white,
                    cancelTextColor: AppColor.primaryColor,
                    textConfirm: "48".tr,
                    textCancel: "49".tr);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Card(
              child: ListTile(
                trailing: const Icon(Icons.translate),
                contentPadding: const EdgeInsets.symmetric(horizontal: 19),
                title: Text("99".tr,
                    style: const TextStyle(fontFamily: "PlayfairDisplay")),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.Orderspending);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: Card(
              child: ListTile(
                trailing: const Icon(Icons.shopping_cart_outlined),
                contentPadding: const EdgeInsets.symmetric(horizontal: 19),
                title: Text("66".tr,
                    style: const TextStyle(fontFamily: "PlayfairDisplay")),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.Orderarchive);
            },
            child: Card(
              child: ListTile(
                trailing: const Icon(Icons.archive_outlined),
                contentPadding: const EdgeInsets.symmetric(horizontal: 19),
                title: Text("67".tr,
                    style: const TextStyle(fontFamily: "PlayfairDisplay")),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.addressview);
            },
            child: Card(
              child: ListTile(
                trailing: const Icon(Icons.location_on_outlined),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 19,
                ),
                title: Text("68".tr,
                    style: const TextStyle(fontFamily: "PlayfairDisplay")),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "46".tr,
                middleText: "71".tr,
                onConfirm: () {
                  controllerSetting.logout();
                },
                onCancel: () {},
                buttonColor: AppColor.primaryColor,
                confirmTextColor: Colors.white,
                cancelTextColor: AppColor.primaryColor,
                textConfirm: "48".tr,
                textCancel: "49".tr);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: Container(
              child: Card(
                child: ListTile(
                  trailing: const Icon(Icons.logout_outlined),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 19),
                  title: Text("69".tr,
                      style: const TextStyle(fontFamily: "PlayfairDisplay")),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
