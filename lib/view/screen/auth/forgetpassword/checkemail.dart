import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../HandlingDataView.dart';
import '../../../../controller/auth/forgetpassword/checkemailController.dart';
import '../../../../core/function/valid.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';

class Checkemail extends StatelessWidget {
  const Checkemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImpcheckemailController controller = Get.put(ImpcheckemailController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GetBuilder<ImpcheckemailController>(
              builder: (controller) => Form(
                key: controller.formstate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    SizedBox(height: size.height * 0.04),
                    Text("Check email",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)
                            .copyWith(
                                color:
                                    const Color.fromARGB(255, 138, 137, 138))),
                    SizedBox(height: size.height * 0.02),
                    CustomTextBodyAuth(text: "34".tr),
                    SizedBox(height: size.height * 0.05),
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
                    CustomButtomAuth(
                        text: "Check",
                        onPressed: () {
                          controller.checkemail();
                        }),
                    SizedBox(height: size.height * 0.05),
                  ]),
                ),
              ),
            )));
  }
}
