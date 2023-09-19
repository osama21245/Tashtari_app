import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../controller/home/homeControoler.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../../core/function/show_rating_home2.dart';
import '../../../core/function/showrating.dart';
import '../../../core/function/showratingHome.dart';
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
        height: size.height * 0.26,
        child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(left: size.width * 0.023),
                child: InkWell(
                  onTap: () {
                    controller.gotoitemdetails(controller.items[i]);
                  },
                  child: item(
                      controller: controller,
                      size: size,
                      itemmodel: controller.items[i]),
                ),
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
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.height * 0.001),
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.01,
              ),
              child: CachedNetworkImage(
                imageUrl: "${Apilinks.linkimageItems}/${itemmodel.itemsImage}",
                height: size.height * 0.15,
                width: size.width * 0.37,
                fit: BoxFit.contain,
              ),
            )),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(83, 66, 16, 112)),
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(28, 97, 208, 228),
                    Color.fromARGB(29, 160, 113, 179),
                    Color.fromARGB(15, 197, 139, 193)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 4)),
              borderRadius: BorderRadius.circular(20)),
          height: size.height * 0.26,
          width: size.width * 0.42,
        ),
        Positioned(
            bottom: size.height * 0.07,
            left: size.width * 0.035,
            child: Text(
              databaseTranslate(
                  "${itemmodel.itemsNameAr}", "${itemmodel.itemsName}"),
              style: TextStyle(
                  fontFamily: "PlayfairDisplay",
                  color:
                      myservices.sharedPreferences.getBool("isDarkMode") == true
                          ? Color.fromARGB(143, 238, 204, 247)
                          : Color.fromARGB(166, 65, 33, 80),
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            )),
        Positioned(
            bottom: size.height * 0.017,
            left: size.width * 0.039,
            child: Text(
              "\$${itemmodel.itemsPrice}.00",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(157, 21, 0, 22)),
            )),
        Positioned(
            bottom: size.height * 0.0478,
            left: size.width * 0.035,
            child: Row(
              children: [
                RatingDisplayWidgetHome2(
                    rating: itemmodel.totalrating == null
                        ? 0.0
                        : double.parse(itemmodel.totalrating!)),
                Text(
                  "(${itemmodel.totalrating})",
                  style: TextStyle(fontSize: 9),
                )
              ],
            ))
      ],
    );
  }
}
