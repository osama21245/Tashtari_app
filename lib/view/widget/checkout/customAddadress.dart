import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routesname.dart';

class customAddaddress extends StatelessWidget {
  const customAddaddress({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offNamed(AppRoutes.addressadd);
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.primaryColor,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "There is no Address to add a New Address\n Click Here",
              style: TextStyle(
                color: Color.fromARGB(255, 161, 60, 53),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
