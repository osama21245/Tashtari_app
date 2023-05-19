import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/data/model/itemmodel.dart';

import '../../../../controller/favouriteController.dart';
import '../../../../controller/item/itemControoler.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/databaseTranslate.dart';
import '../../../../linksApi.dart';

class Customitems extends GetView<ImpitemControoler> {
  Itemmodel itemmodel;

  Customitems({
    super.key,
    required this.itemmodel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        controller.gotoitemdetails(itemmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CachedNetworkImage(
                  height: size.height * 0.15,
                  fit: BoxFit.fill,
                  imageUrl:
                      Apilinks.linkimageItems + "/" + itemmodel.itemsImage!,
                ),
              ),
              Text(
                databaseTranslate(
                    "${itemmodel.itemsNameAr}", "${itemmodel.itemsName}"),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 16,
                    color: Colors.black),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 15,
                              ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemmodel.itemsPrice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  GetBuilder<ImpfavourateController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemmodel.itemsId] == 1) {
                              controller.setfavorite(itemmodel.itemsId, 0);
                              controller
                                  .deletefromfav(itemmodel.itemsId.toString());
                            } else if (controller
                                    .isFavorite[itemmodel.itemsId] ==
                                0) {
                              controller.setfavorite(itemmodel.itemsId, 1);
                              controller.addtofav(itemmodel.itemsId.toString());
                            }
                          },
                          icon: controller.isFavorite[itemmodel.itemsId] == 1
                              ? Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: AppColor.primaryColor,
                                )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
