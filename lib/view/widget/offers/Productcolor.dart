import 'package:flutter/material.dart';

class Productclo extends StatelessWidget {
  Productclo({Key? key, required this.color, required this.ischecked})
      : super(key: key);

  @override
  final Color color;
  bool ischecked;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 / 2.5),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: ischecked
                  ? Color.fromARGB(255, 241, 233, 152)
                  : Colors.transparent)),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
