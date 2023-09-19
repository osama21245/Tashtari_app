import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/profile_pic.dart';

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
        SizedBox(height: size.height * 0.05),
        Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 23,
              fontFamily: "Gordita",
              color: Color.fromARGB(255, 85, 85, 85)),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        ProfilePic(),
        SizedBox(
          height: Get.width / 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.dark_mode_outlined),
                SizedBox(width: 20),
                Expanded(
                    child: Text("63".tr,
                        style: TextStyle(color: AppColor.primaryColor))),
                Switch(
                    value: ThemeSrevice().isSavedDarkMode(),
                    onChanged: (value2) {
                      setState(() {
                        ThemeSrevice().changeTheme();
                      });
                    }),
                //Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/User.svg",
                  color: AppColor.primaryColor,
                  width: 22,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text(
                  "64".tr,
                  style: TextStyle(color: AppColor.primaryColor),
                )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {
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
                      middleText:
                          "هل تريد تغيير اللغه الي اللفه الانجليزيه ".tr,
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
            child: Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  color: AppColor.primaryColor,
                ),
                SizedBox(width: 20),
                Expanded(child: Text("99".tr)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.Orderspending);
            },
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.primaryColor,
                ),
                SizedBox(width: 20),
                Expanded(child: Text("66".tr)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.Orderarchive);
            },
            child: Row(
              children: [
                Icon(
                  Icons.archive_outlined,
                  color: AppColor.primaryColor,
                ),
                SizedBox(width: 20),
                Expanded(child: Text("67".tr)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColor.primaryColor,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.addressview);
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primaryColor,
                ),
                SizedBox(width: 20),
                Expanded(child: Text("68".tr)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: AppColor.primaryColor,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xFFF5F6F9),
              ),
              onPressed: () {
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
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/Log out.svg",
                    color: AppColor.primaryColor,
                    width: 22,
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text("69".tr)),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
