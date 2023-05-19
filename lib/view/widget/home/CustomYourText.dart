import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Customyourtext extends StatelessWidget {
  String Title;

  Customyourtext({super.key, required this.Title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(Title,
          style: TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
