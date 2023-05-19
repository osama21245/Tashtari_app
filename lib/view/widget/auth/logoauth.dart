import 'package:flutter/material.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(0), // Border radius
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.backgroundcolor,
        ),
        height: size.height * 0.17,
        width: size.width * 0.1,
        child: Image.asset(
          AppImageAsset.logo,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
