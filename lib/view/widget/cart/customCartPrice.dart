import 'package:flutter/material.dart';
import 'package:woocommerce_app/core/constant/color.dart';

class CustomCartPrice extends StatelessWidget {
  String Texte;
  String Price;
  bool? active;
  CustomCartPrice(
      {super.key, required this.Texte, required this.Price, this.active});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(Texte,
                style: const TextStyle(
                  color: Color.fromARGB(255, 128, 128, 128),
                  fontSize: 19,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              Price,
              style: TextStyle(
                color: active == false
                    ? const Color.fromARGB(255, 128, 128, 128)
                    : AppColor.primaryColor,
                fontSize: 19,
              ),
            ),
          )
        ],
      ),
    );
  }
}
