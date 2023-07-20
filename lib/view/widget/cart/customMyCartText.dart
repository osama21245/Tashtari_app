import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class CustomMycarText extends StatelessWidget {
  String textname;
  CustomMycarText({super.key, required this.textname});

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
                  color: Color.fromARGB(255, 129, 129, 129),
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
