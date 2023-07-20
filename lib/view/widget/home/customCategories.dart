import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/data/datasource/static/staticimage.dart';
import 'package:woocommerce_app/linksApi.dart';

import '../../../core/function/databaseTranslate.dart';
import '../../../data/model/categories_model.dart';
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
        itemCount: controller.categories.length,
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
                gradient: LinearGradient(
                    colors: [
                      AppColor.secoundColor,
                      const Color.fromARGB(94, 197, 139, 193),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(3.14 / 4)),
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
            style: TextStyle(
              fontSize: myservices.sharedPreferences.getString("lang") == "ar"
                  ? 12
                  : 16,
            ),
          )
        ],
      ),
    );
  }
}
