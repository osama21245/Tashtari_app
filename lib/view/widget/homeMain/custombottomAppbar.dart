import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customBottomAppbar extends StatelessWidget {
  void Function()? onpressed;
  String Texticon;
  IconData icon;

  bool? active;
  customBottomAppbar(
      {super.key,
      required this.Texticon,
      required this.icon,
      required this.onpressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onpressed,
      child: Container(
        width: size.width * 0.13,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active == true ? Colors.blue : null,
            ),
            Text(
              Texticon,
              style: TextStyle(
                  color: active == true ? Colors.blue : null, fontSize: 9),
            )
          ],
        ),
      ),
    );
  }
}
