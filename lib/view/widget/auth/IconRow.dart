import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconRow extends StatelessWidget {
  IconRow({Key? key, required this.photo}) : super(key: key);

  @override
  String photo;
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          photo,
          height: 30,
          color: Colors.purple[400],
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 1, color: const Color.fromARGB(255, 142, 36, 170)),
      ),
    );
  }
}
