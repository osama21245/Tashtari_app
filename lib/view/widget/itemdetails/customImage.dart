import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';
import 'package:woocommerce_app/linksApi.dart';

import '../../../core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Customimage extends GetView<ImpitemdetailsController> {
  Customimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * 0.25,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        Positioned(
          top: size.height * 0.09,
          left: size.width * 0.23,
          child: Container(
            height: size.height * 0.33,
            width: size.width * 0.5,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(200)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
              child: CachedNetworkImage(
                imageUrl: Apilinks.linkimageItems +
                    "/" +
                    controller.itemmodel!.itemsImage!,
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
