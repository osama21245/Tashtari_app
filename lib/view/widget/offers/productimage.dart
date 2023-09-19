import 'package:flutter/material.dart';

import '../../../linksApi.dart';

class ProductImg extends StatelessWidget {
  const ProductImg({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: size.width * 0.8,
      child: Stack(children: [
        Container(
          height: size.width * 0.7,
          width: size.width * 0.7,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        Image.network(
          "${Apilinks.linkimageItems}/${image}",
          height: size.width * 0.75,
          width: size.width * 0.75,
        )
      ]),
    );
  }
}
