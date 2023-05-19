import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemControoler.dart';
import 'package:woocommerce_app/view/widget/home/customSearch.dart';

import '../../../../core/constant/color.dart';
import '../../../../data/datasource/staticIcon.dart';
import '../../../widget/homeMain/item/customCategoriesitem.dart';

class item extends StatelessWidget {
  dynamic katindex;
  int i;
  item({super.key, required this.i, required this.katindex});

  @override
  Widget build(BuildContext context) {
    // ImpitemControoler controller = Get.put(ImpitemControoler());
    Size size = MediaQuery.of(context).size;
    // var selectedkat = Get.arguments("selsectedKat");

    return InkWell(
      onTap: () {
        katindex = iconList[i].category;
      },
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.006,
          ),
          // GetBuilder<ImpitemControoler>(
          // builder:
          // (controller) {
          // return
          Container(
            decoration: katindex == iconList[i].category
                ? BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)))
                : null,
            padding: EdgeInsets.all(10),
            child: Text(
              "${iconList[i].category}",
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 44, 43, 43)),
            ),
          ),
        ],
      ),
    );
  }
}
