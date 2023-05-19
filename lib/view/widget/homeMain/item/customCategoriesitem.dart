import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woocommerce_app/controller/item/itemControoler.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../../core/function/databaseTranslate.dart';
import '../../../../data/datasource/staticIcon.dart';
import '../../../../data/model/categoriesmodel.dart';
import '../../../../linksApi.dart';
import '../../../screen/home/items/itempage.dart';

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
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: controller.selectedkat == i
                        ? BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 212, 178, 226))))
                        : BoxDecoration(),
                    child: Text(
                      "${databaseTranslate(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                      style: TextStyle(
                          fontSize: controller.langSelected == "ar" ? 23 : 19,
                          color: Color.fromARGB(255, 44, 43, 43)),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
 // return InkWell(
          //   onTap: () {},
          //   child: ListView(
          //     children: [
          //       SizedBox(
          //         height: size.height * 0.005,
          //       ),
          //       Container(
          //         decoration: controller.selectedkat == i
          //             ? BoxDecoration(
          //                 border: Border(
          //                     bottom: BorderSide(
          //                         width: 3, color: AppColor.primaryColor)))
          //             : BoxDecoration(border: Border()),
          //         padding: EdgeInsets.all(10),
          //         child: Text(
          //           "${iconList[index].category}",
          //           style: const TextStyle(
          //               fontSize: 16, color: Color.fromARGB(255, 44, 43, 43)),
          //         ),
          //       )
          //     ],
          //   ),
          // );