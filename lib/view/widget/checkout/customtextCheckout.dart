import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class customtextCheckout extends StatelessWidget {
  String textname;
  customtextCheckout({super.key, required this.textname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 27, bottom: 11),
      child: Text(
        textname,
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "PlayfairDisplay"),
      ),
    );
  }
}
