import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homeControoler.dart';
import '../../../data/datasource/static/APIs/woocommere_api.dart';
import '../../../data/model/itemmodel.dart';
import '../../../linksApi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Customsales extends GetView<ImphomePageControoler> {
  const Customsales({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Woocommerce_r controoller2 = Woocommerce_r();
    return SizedBox(
        height: 200,
        child: GetBuilder<ImphomePageControoler>(builder: (c) {
          return Container(
            height: size.height * 0.2,
            child: ListView.builder(
                itemCount: controller.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return item(
                      controller: controller,
                      size: size,
                      itemmodel: Itemmodel.fromJson(controller.items[i]));
                }),
          );
        }));
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl: "${Apilinks.linkimageItems}/${itemmodel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
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
              "${itemmodel.itemsImage}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
