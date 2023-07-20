import 'package:flutter/material.dart';
import 'package:woocommerce_app/core/function/databaseTranslate.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class Customyourtext extends StatelessWidget {
  String Title;

  Customyourtext({super.key, required this.Title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myservices.sharedPreferences.getString("lang") == "ar"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(Title,
          style: const TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
