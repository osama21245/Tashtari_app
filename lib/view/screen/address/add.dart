import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/address/addController.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Addressadd extends StatelessWidget {
  const Addressadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpadressAddController());
    return Scaffold(
        appBar: AppBar(
          title: Text("92".tr),
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<ImpadressAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 13,
                      right: 13,
                    ),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustonTextFormAuth(
                              valid: (val) {
                                return validinput(val!, 1, 100, "username");
                              },
                              mycontroller: controller.addresscity,
                              hinttext: "93".tr,
                              iconData: Icons.location_city,
                              labeltext: "93".tr
                              // mycontroller: ,
                              ),
                          CustonTextFormAuth(
                              valid: (val) {
                                return validinput(val!, 2, 100, "username");
                              },
                              mycontroller: controller.addressStreet,
                              hinttext: "94".tr,
                              iconData: Icons.streetview_outlined,
                              labeltext: "94".tr
                              // mycontroller: ,
                              ),
                          CustonTextFormAuth(
                              valid: (val) {
                                return validinput(val!, 1, 100, "username");
                              },
                              mycontroller: controller.addressname,
                              hinttext: "95".tr,
                              iconData: Icons.location_on_outlined,
                              labeltext: "95".tr
                              // mycontroller: ,
                              ),
                          CustomButtomAuth(
                            text: "96".tr,
                            onPressed: () {
                              controller.AddCompleted();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
