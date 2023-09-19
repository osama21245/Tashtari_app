import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/offersController.dart';
import 'package:woocommerce_app/data/model/item_model.dart';
import 'package:woocommerce_app/view/widget/offers/productimage.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/function/databaseTranslate.dart';
import '../../../../linksApi.dart';
import '../../../core/function/showratingHome.dart';
import 'Productcolor.dart';

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
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(0, 255, 255, 255),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 70,
                    offset: Offset(0, 15),
                    color: Colors.black12)
              ]),
          height: size.height * 0.27,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: size.height * 0.23,
              ),
              Positioned(
                  top: 0,
                  left: -size.width * 0.1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.2,
                    width: size.width * 0.6,
                    child: Image.network(
                      "${Apilinks.linkimageItems}/${itemmodel.itemsImage}",
                      width: size.width * 0.59,
                    ),
                  )),
              Positioned(
                  left: size.width * 0.5,
                  child: SizedBox(
                    height: size.height * 0.195,
                    width: size.width - size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            databaseTranslate(
                                itemmodel.itemsName, itemmodel.itemsName),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            databaseTranslate(itemmodel.itemsDecriptiomAr,
                                itemmodel.itemsDescriptiom),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Theme.of(context).secondaryHeaderColor),
                            child: Text(
                              'السعر:/${itemmodel.itemsPrice}',
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              if (itemmodel.itemsDiscount != 0)
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/001-sale.png",
                      height: size.height * 0.06,
                    )),
              Positioned(
                  left: size.width * 0.07,
                  bottom: size.height * 0.02,
                  child: RatingDisplayWidgetHome(
                      rating: itemmodel.totalrating == null
                          ? 0.0
                          : double.parse(itemmodel.totalrating!)))
            ],
          ),
        ));
  }
}
// }  if (itemmodel.itemsDiscount != 0)
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 27.0, left: 2),
//                               child: Text(
//                                 "${itemmodel.itemsPrice}",
//                                 style: const TextStyle(
//                                     decoration: TextDecoration.lineThrough,
//                                     color: AppColor.primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15),
//                               ),
//                             ),

