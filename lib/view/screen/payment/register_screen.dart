import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';
import 'package:woocommerce_app/controller/payment/paymentController.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../widget/payment/default_button.dart';
import '../../widget/payment/default_textformfiled.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ImppaymentController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Integration'),
          backgroundColor: Colors.purple.shade400,
          centerTitle: true,
        ),
        body: GetBuilder<ImppaymentController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/Delivery.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.42,
                          ),
                        ),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DefaultTextFormFiled(
                                      controller:
                                          controller.firstNameController,
                                      type: TextInputType.name,
                                      hintText: 'First name',
                                      prefix: Icons.person,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your first name!';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              const SizedBox(height: 10),
                              DefaultTextFormFiled(
                                controller: controller.emailController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email  !';
                                  }
                                  return null;
                                },
                                type: TextInputType.emailAddress,
                                hintText: 'Email',
                                prefix: Icons.email,
                              ),
                              const SizedBox(height: 10),
                              DefaultTextFormFiled(
                                controller: controller.phoneController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone !';
                                  }
                                  return null;
                                },
                                type: TextInputType.number,
                                hintText: 'Phone',
                                prefix: Icons.phone,
                              ),
                              const SizedBox(height: 10),
                              const SizedBox(height: 20),
                              DefaultButton(
                                buttonWidget: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 1.6,
                                  ),
                                ),
                                function: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    Get.toNamed(AppRoutes.Toggel);
                                  }
                                },
                                width: MediaQuery.of(context).size.width,
                                radius: 10.0,
                                backgroundColor: Colors.purple.shade300,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
