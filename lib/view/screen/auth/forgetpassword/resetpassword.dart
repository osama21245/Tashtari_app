import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../HandlingDataView.dart';
import '../../../../controller/auth/forgetpassword/resetpasswordController.dart';
import '../../../../core/function/valid.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImpresetpasswordController controller =
        Get.put(ImpresetpasswordController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            SizedBox(height: size.height * 0.04),
            Text("37".tr,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                        .copyWith(color: Color.fromARGB(255, 138, 137, 138))),
            SizedBox(height: size.height * 0.015),
            CustomTextBodyAuth(text: "38".tr),
            SizedBox(height: size.height * 0.07),
            GetBuilder<ImpresetpasswordController>(
              builder: (controller) => CustonTextFormAuth(
                ontap: () {
                  controller.changepass();
                },
                hidepassword: controller.showpassword,
                valid: (val) {
                  return validinput(val!, 6, 40, "password");
                },
                mycontroller: controller.password,
                hinttext: "11".tr,
                iconData: Icons.lock_outline,
                labeltext: "12".tr,
                // mycontroller: ,
              ),
            ),
            CustomButtomAuth(
                text: "39".tr,
                onPressed: () {
                  controller.ResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    ));
  }
}
