import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';
import 'package:woocommerce_app/linksApi.dart';

import '../../../core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Customimage extends GetView<ImpitemdetailsController> {
  const Customimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * 0.27,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(125, 97, 208, 228),
                    AppColor.primaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 4)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        Positioned(
          left: size.width * 0.18,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Hero(
              tag: "${controller.itemmodel!.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${Apilinks.linkimageItems}/${controller.itemmodel!.itemsImage!}",
                height: size.height * 0.52,
                width: size.width * 0.52,
              ),
            ),
          ),
        )
      ],
    );
  }
}
