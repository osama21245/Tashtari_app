import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/routesname.dart';
import '../../../widget/auth/custombuttonauth.dart';

class sucessResetPassword extends StatelessWidget {
  const sucessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Succes',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          SizedBox(height: size.height * 0.03),
          const Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 30),
            child: const Text(
              "Your Email Has Been Created",
              style: TextStyle(
                  fontSize: 23, color: Color.fromARGB(255, 95, 78, 100)),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                  text: "Go To Login",
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.login);
                  })),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
