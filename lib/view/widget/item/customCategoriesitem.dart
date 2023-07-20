import 'package:flutter/material.dart';
import 'package:woocommerce_app/controller/item/itemControoler.dart';
import 'package:get/get.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../../data/model/categories_model.dart';

// ignore: must_be_immutable
class Customcategoriesitem extends GetView<ImpitemControoler> {
  dynamic katindex;
  Customcategoriesitem({super.key, required this.katindex});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpitemControoler());
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: controller.langSelected == "ar" ? 25 : 20),
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

class Categories extends GetView<ImpitemControoler> {
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
        controller.changekat(i!, categoriesmodel.categoriesId.toString());
      },
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: controller.langSelected == "ar" ? 4 : 3, top: 2),
              child: GetBuilder<ImpitemControoler>(
                builder: (c) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    decoration: controller.selectedkat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 212, 178, 226))))
                        : const BoxDecoration(),
                    child: Text(
                      "${databaseTranslate(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                      style: TextStyle(
                        fontSize: controller.langSelected == "ar" ? 23 : 19,
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
