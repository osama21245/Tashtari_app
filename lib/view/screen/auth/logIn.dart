import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';
import 'package:woocommerce_app/core/function/Exit.dart';
import '../../../controller/auth/loginController.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImploginController controller = Get.put(ImploginController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: ExitApp,
              child: Form(
                key: controller.formstate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    LogoAuth(),
                    SizedBox(height: size.height * 0.04),
                    Text('7'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Color.fromARGB(255, 138, 137, 138))),
                    SizedBox(height: size.height * 0.03),
                    CustomTextBodyAuth(text: "8".tr),
                    SizedBox(height: size.height * 0.03),
                    CustonTextFormAuth(
                      valid: (val) {
                        return validinput(val!, 8, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "9".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "10".tr,
                      // mycontroller: ,
                    ),
                    GetBuilder<ImploginController>(
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
                    InkWell(
                      onTap: () {
                        controller.gotocheckemail();
                      },
                      child: Text(
                        "13".tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtomAuth(
                        text: "7".tr,
                        onPressed: () {
                          controller.login();
                        }),
                    SizedBox(height: size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("15".tr),
                        InkWell(
                          onTap: () {
                            controller.gotosignup();
                          },
                          child: Text("14".tr,
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