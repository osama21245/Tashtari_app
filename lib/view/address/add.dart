import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../HandlingDataView.dart';
import '../../controller/address/addController.dart';
import '../../core/constant/color.dart';
import '../../core/function/valid.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/auth/customtextformauth.dart';

class Addressadd extends StatelessWidget {
  const Addressadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpadressAddController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Address"),
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
                              hinttext: "City",
                              iconData: Icons.location_city,
                              labeltext: "City"
                              // mycontroller: ,
                              ),
                          CustonTextFormAuth(
                              valid: (val) {
                                return validinput(val!, 2, 100, "username");
                              },
                              mycontroller: controller.addressStreet,
                              hinttext: "Street",
                              iconData: Icons.streetview_outlined,
                              labeltext: "Street"
                              // mycontroller: ,
                              ),
                          CustonTextFormAuth(
                              valid: (val) {
                                return validinput(val!, 1, 100, "username");
                              },
                              mycontroller: controller.addressname,
                              hinttext: "Name",
                              iconData: Icons.location_on_outlined,
                              labeltext: "Name"
                              // mycontroller: ,
                              ),
                          CustomButtomAuth(
                            text: "Add",
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
