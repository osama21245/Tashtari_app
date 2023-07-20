import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class customPaymentType extends StatelessWidget {
  String textname;
  bool condetion;
  final void Function()? onpressed;
  customPaymentType(
      {super.key,
      required this.condetion,
      required this.textname,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: condetion == true
                  ? AppColor.primaryColor
                  : AppColor.thirdColor,
              borderRadius: BorderRadius.circular(30)),
          child: Text(textname,
              style: TextStyle(
                color: condetion == true ? Colors.white : AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
