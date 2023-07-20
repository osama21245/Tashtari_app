import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class custombottomnavigitionCheckout extends StatelessWidget {
  final void Function()? onpressed;
  const custombottomnavigitionCheckout({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MaterialButton(
        onPressed: onpressed,
        child: const Text("Checkout"),
        color: AppColor.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
