import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';
import 'package:woocommerce_app/controller/auth/signupControoler.dart';

import '../../../core/constant/color.dart';
import '../../../core/function/valid.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ImpsignupController());
    //Get.put(() => ImpsignupController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GetBuilder<ImpsignupController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: ListView(children: [
                        SizedBox(height: size.height * 0.04),
                        Text('14'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)
                                .copyWith(
                                    color: const Color.fromARGB(
                                        255, 138, 137, 138))),
                        SizedBox(height: size.height * 0.05),
                        CustomTextBodyAuth(text: "8".tr),
                        SizedBox(height: size.height * 0.03),
                        CustonTextFormAuth(
                          valid: (val) {
                            return validinput(val!, 4, 15, "username");
                          },
                          mycontroller: controller.username,
                          hinttext: "17".tr,
                          iconData: Icons.person_outlined,
                          labeltext: "21".tr,
                          // mycontroller: ,
                        ),
                        CustonTextFormAuth(
                          valid: (val) {
                            return validinput(val!, 8, 70, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "9".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "10".tr,
                          // mycontroller: ,
                        ),
                        CustonTextFormAuth(
                          valid: (val) {
                            return validinput(val!, 10, 20, "phone");
                          },
                          mycontroller: controller.phone,
                          hinttext: "18".tr,
                          iconData: Icons.phone_android_outlined,
                          labeltext: "20".tr,
                          // mycontroller: ,
                        ),
                        GetBuilder<ImpsignupController>(
                          builder: (controller) => CustonTextFormAuth(
                            ontap: () {
                              controller.changepass();
                            },
                            hidepassword: controller.showpassword,
                            valid: (val) {
                              return validinput(val!, 6, 100, "password");
                            },
                            mycontroller: controller.password,
                            hinttext: "11".tr,
                            iconData: Icons.lock_outline,
                            labeltext: "12".tr,
                            // mycontroller: ,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomButtomAuth(
                            text: "14".tr,
                            onPressed: () {
                              controller.signup();
                            }),
                        SizedBox(height: size.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("19".tr),
                            InkWell(
                              onTap: () {
                                controller.gotologin();
                              },
                              child: Text("7".tr,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
