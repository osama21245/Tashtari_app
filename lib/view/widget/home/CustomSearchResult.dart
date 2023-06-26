import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../controller/home/homeControoler.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../../data/model/item_model.dart';
import '../../../linksApi.dart';

// ignore: camel_case_types
class searchResult extends GetView<ImphomePageControoler> {
  final List<Itemmodel> itemmodel;
  const searchResult({required this.itemmodel, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: itemmodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CachedNetworkImage(
                                imageUrl: Apilinks.linkimageItems +
                                    "/" +
                                    itemmodel[index].itemsImage!,
                                fit: BoxFit.fill,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(databaseTranslate(
                                        "${itemmodel[index].itemsNameAr}",
                                        "${itemmodel[index].itemsName}")),
                                    subtitle: Text(databaseTranslate(
                                        "${itemmodel[index].categoriesNameAr}",
                                        "${itemmodel[index].categoriesName}")),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color.fromARGB(255, 224, 224, 224),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${itemmodel[index].itemsPrice}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              MaterialButton(
                                  textColor: Colors.white,
                                  color: AppColor.primaryColor,
                                  onPressed: () {
                                    controller
                                        .gotoitemdetails(itemmodel[index]);
                                  },
                                  child: const Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (itemmodel[index].itemsDiscount != "0")
                    Image.asset(
                      "assets/images/001-sale.png",
                      height: size.height * 0.06,
                    )
                ],
              ),
            ));
  }
}
