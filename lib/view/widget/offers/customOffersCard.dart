import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/offersController.dart';
import 'package:woocommerce_app/data/model/item_model.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/function/databaseTranslate.dart';
import '../../../../linksApi.dart';

// ignore: must_be_immutable
class CustomOffersCard extends GetView<ImpoffersController> {
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
                          "${Apilinks.linkimageItems}/${itemmodel.itemsImage!}",
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
                          "${controlleroffer.delevirytime} - ${controlleroffer.delevirytime! + 10}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text("100".tr,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
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
                            // ignore: unrelated_type_equality_checks
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
                          // ignore: unrelated_type_equality_checks
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
                    ],
                  ),
                ],
              ),
            ),
            // ignore: unrelated_type_equality_checks
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
