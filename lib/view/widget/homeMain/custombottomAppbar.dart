import 'package:flutter/material.dart';

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
    return MaterialButton(
      onPressed: onpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Colors.blue : Colors.black,
          ),
          Text(
            Texticon,
            style: TextStyle(
                color: active == true
                    ? Colors.blue
                    : Color.fromARGB(255, 71, 71, 71)),
          )
        ],
      ),
    );
  }
}
