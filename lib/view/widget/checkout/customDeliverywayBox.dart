import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class customDeliverywayBox extends StatelessWidget {
  String textname;
  String imageurl;
  bool condetion;
  Size size;
  final void Function()? onpressed;
  customDeliverywayBox(
      {super.key,
      required this.size,
      required this.condetion,
      required this.imageurl,
      required this.textname,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: size.height * 0.18,
          width: size.width * 0.32,
          decoration: BoxDecoration(
              color: condetion == true ? AppColor.primaryColor : null,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: AppColor.primaryColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageurl,
                height: size.height * 0.1,
                color: condetion == true ? Colors.white : null,
              ),
              Text(
                textname,
                style: TextStyle(
                  color:
                      condetion == true ? Colors.white : AppColor.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
