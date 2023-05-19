import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/controller/item/itemControoler.dart';
import 'package:woocommerce_app/data/datasource/static/staticimage.dart';
import 'package:woocommerce_app/linksApi.dart';
import 'package:woocommerce_app/view/screen/home/items/itemmain.dart';

import '../../../core/function/databaseTranslate.dart';
import '../../../data/datasource/staticIcon.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../screen/home/items/itempage.dart';
import '../homeMain/item/customCategoriesitem.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customcategories extends GetView<ImphomePageControoler> {
  const Customcategories({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: imagelist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            size: size,
            categoriesmodel:
                Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ImphomePageControoler> {
  const Categories(
      {super.key,
      required this.size,
      required this.categoriesmodel,
      required this.i});
  final Categoriesmodel categoriesmodel;
  final Size size;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoitem(
            controller.categories, i!, categoriesmodel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 192, 229),
                borderRadius: BorderRadius.circular(180)),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: size.height * 0.09,
            width: size.width * 0.19,
            child: SvgPicture.network(
                "${Apilinks.linkimageCategories}/${categoriesmodel.categoriesImage}"),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Text(
            databaseTranslate("${categoriesmodel.categoriesNameAr}",
                "${categoriesmodel.categoriesName}"),
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 44, 43, 43)),
          )
        ],
      ),
    );
  }
}