import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class CustombuttomNavigationbar extends StatelessWidget {
  final void Function() onpressed;
  String buttonName;

  CustombuttomNavigationbar(
      {super.key, required this.buttonName, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: onpressed,
          child: Text(buttonName),
        ),
      ),
    );
  }
}
