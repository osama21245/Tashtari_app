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
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(125, 97, 208, 228),
                AppColor.secoundColor,
                AppColor.secoundColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(3.14 / 4)),
        ),
        height: size.height * 0.05,
        width: size.width,
        child: MaterialButton(
          textColor: Colors.white,
          onPressed: onpressed,
          child: Text(buttonName),
        ),
      ),
    );
  }
}
