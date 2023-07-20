import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signupVerifyCodeController.dart';
import '../../widget/auth/customtextbodyauth.dart';

class signupVerifyCode extends StatelessWidget {
  const signupVerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImpsignupVerifycodeController controller =
        Get.put(ImpsignupVerifycodeController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          SizedBox(height: size.height * 0.04),
          Text("36".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  .copyWith(color: const Color.fromARGB(255, 138, 137, 138))),
          SizedBox(height: size.height * 0.02),
          GetBuilder<ImpsignupVerifycodeController>(
              builder: (controller) => CustomTextBodyAuth(
                  text: "please Enter The Code Send to ${controller.email}")),
          SizedBox(height: size.height * 0.05),
          OtpTextField(
            borderWidth: 3,
            fieldWidth: size.width * 0.14,
            numberOfFields: 5,
            borderColor: const Color.fromARGB(255, 0, 0, 0),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {},
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.getData(verificationCode);
            }, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
