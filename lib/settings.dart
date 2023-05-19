import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import 'controller/settingscontroller.dart';

class Settings extends GetView<ImphomePageControoler> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    ImpsettingsController controllerSetting = Get.put(ImpsettingsController());

    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2.3,
              width: Get.width,
              color: AppColor.primaryColor,
            ),
            Container(
              width: Get.width,
              height: Get.width / 2.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      " - Hello ${controller.name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: "Cairo"),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: size.width * 0.007,
                        ),
                        Text(
                          "${controller.email}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Cairo"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: size.width * 0.007,
                        ),
                        Text(
                          "${controller.phone}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Cairo"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: Get.width / 3.4,
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 38),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 247, 246, 246),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(255, 247, 246, 246),
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
            child: ListTile(
              trailing: Switch(value: true, onChanged: (value2) {}),
              contentPadding: EdgeInsets.symmetric(horizontal: 19),
              title: Text("Off Notfication",
                  style: TextStyle(fontFamily: "PlayfairDisplay")),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: Card(
            child: ListTile(
              trailing: Icon(Icons.info_outline),
              contentPadding: EdgeInsets.symmetric(horizontal: 19),
              title: Text(
                "About Us",
                style: TextStyle(fontFamily: "PlayfairDisplay"),
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
              trailing: Icon(Icons.phone),
              contentPadding: EdgeInsets.symmetric(horizontal: 19),
              title: Text("Contact Us",
                  style: TextStyle(fontFamily: "PlayfairDisplay")),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          child: Card(
            child: ListTile(
              trailing: Icon(Icons.location_on_outlined),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 19,
              ),
              title: Text("Adress",
                  style: TextStyle(fontFamily: "PlayfairDisplay")),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "Warning",
                middleText: "Are you sure you want to log out",
                onConfirm: () {
                  controllerSetting.logout();
                },
                onCancel: () {},
                buttonColor: AppColor.primaryColor,
                confirmTextColor: Colors.white,
                cancelTextColor: AppColor.primaryColor,
                textConfirm: "Yes",
                textCancel: "No");
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: Container(
              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.logout_outlined),
                  contentPadding: EdgeInsets.symmetric(horizontal: 19),
                  title: Text("Log Out",
                      style: TextStyle(fontFamily: "PlayfairDisplay")),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}