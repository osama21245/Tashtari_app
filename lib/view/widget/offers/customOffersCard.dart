import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/offersController.dart';
import 'package:woocommerce_app/data/model/item_model.dart';

import '../../../../controller/favouriteController.dart';
import '../../../../controller/item/itemControoler.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/databaseTranslate.dart';
import '../../../../linksApi.dart';

// ignore: must_be_immutable
class CustomOffersCard extends GetView<ImpitemControoler> {
  Itemmodel itemmodel;

  CustomOffersCard({
    super.key,
    required this.itemmodel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ImpoffersController controlleroffer = ImpoffersController();

    return InkWell(
      onTap: () {
        controller.gotoitemdetails(itemmodel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
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
                    children: [
                      const Icon(Icons.timer_outlined),
                      Text(
                          "${controlleroffer.delevirytime} - ${controlleroffer.delevirytime! + 10} minutes",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${itemmodel.itemspricediscount} \$",
                            style: itemmodel.itemsDiscount == 0
                                ? const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21)
                                : const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                          ),
                          if (itemmodel.itemsDiscount != 0)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 27.0, left: 2),
                              child: Text(
                                "${itemmodel.itemsPrice}",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            )
                        ],
                      ),
                      GetBuilder<ImpfavourateController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemmodel.itemsId] ==
                                    1) {
                                  controller.setfavorite(itemmodel.itemsId, 0);
                                  controller.deletefromfav(
                                      itemmodel.itemsId.toString());
                                } else if (controller
                                        .isFavorite[itemmodel.itemsId] ==
                                    0) {
                                  controller.setfavorite(itemmodel.itemsId, 1);
                                  controller
                                      .addtofav(itemmodel.itemsId.toString());
                                }
                              },
                              icon:
                                  controller.isFavorite[itemmodel.itemsId] == 1
                                      ? const Icon(
                                          Icons.favorite,
                                          color: AppColor.primaryColor,
                                        )
                                      : const Icon(
                                          Icons.favorite_outline,
                                          color: AppColor.primaryColor,
                                        )))
                    ],
                  ),
                ],
              ),
            ),
            if (itemmodel.itemsDiscount != 0)
              Image.asset(
                "assets/images/001-sale.png",
                height: size.height * 0.06,
              )
          ],
        ),
      ),
    );
  }
}
