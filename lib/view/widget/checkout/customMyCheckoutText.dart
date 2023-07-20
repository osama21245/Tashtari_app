import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:woocommerce_app/core/constant/color.dart';

// ignore: must_be_immutable
class CustomMyCheckouutText extends StatelessWidget {
  String textname;
  CustomMyCheckouutText({super.key, required this.textname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13.0,
      ),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textname,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: "PlayfairDisplay",
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w700),
            ),
            const Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 129, 129, 129),
            )
          ],
        ),
      ),
    );
  }
}
