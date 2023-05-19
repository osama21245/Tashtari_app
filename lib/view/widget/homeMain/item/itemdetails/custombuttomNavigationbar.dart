import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class CustombuttomNavigationbar extends StatelessWidget {
  const CustombuttomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.073,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: () {},
          child: Text("Add to Cart"),
        ),
      ),
    );
  }
}
