import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';

class sucessSignup extends StatelessWidget {
  const sucessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Succes',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          SizedBox(height: size.height * 0.03),
          const Text(
            "Your Email Has Been Created",
            style: TextStyle(
                fontSize: 23, color: Color.fromARGB(255, 95, 78, 100)),
          ),
          const Spacer(),
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
