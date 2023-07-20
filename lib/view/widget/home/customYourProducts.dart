import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../controller/home/homeControoler.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../../data/model/item_model.dart';
import '../../../linksApi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Customyourproducts extends GetView<ImphomePageControoler> {
  const Customyourproducts({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ImphomePageControoler>(builder: (c) {
      return Container(
        height: size.height * 0.2,
        child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  controller.gotoitemdetails(controller.items[i]);
                },
                child: item(
                    controller: controller,
                    size: size,
                    itemmodel: controller.items[i]),
              );
            }),
      );
    });
  }
}

class item extends StatelessWidget {
  const item({
    super.key,
    required this.controller,
    required this.size,
    required this.itemmodel,
  });

  final ImphomePageControoler controller;
  final Size size;
  final Itemmodel itemmodel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: CachedNetworkImage(
                imageUrl: "${Apilinks.linkimageItems}/${itemmodel.itemsImage}",
                height: size.height * 0.12,
                width: size.width * 0.30,
                fit: BoxFit.fill,
              ),
            )),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: size.height * 0.17,
          width: size.width * 0.48,
        ),
        Positioned(
            left: 23,
            child: Text(
              databaseTranslate(
                  "${itemmodel.itemsNameAr}", "${itemmodel.itemsName}"),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )),
        Positioned(
            right: size.width * 0.07,
            bottom: size.height * 0.035,
            child: Text(
              "${itemmodel.itemspricediscount}\$",
              style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ))
      ],
    );
  }
}
