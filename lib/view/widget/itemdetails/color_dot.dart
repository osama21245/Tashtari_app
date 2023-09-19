import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.isActive,
  }) : super(key: key);

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppColor.defaultPadding / 4),
      decoration: BoxDecoration(
        border: Border.all(
            color: isActive ? AppColor.primaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}
