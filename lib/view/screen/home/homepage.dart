import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../HandlingDataView.dart';

import '../../widget/home/CustomSearchResult.dart';
import '../../widget/home/CustomYourText.dart';
import '../../widget/home/customCategories.dart';
import '../../widget/home/customOffers.dart';
import '../../widget/home/customSales.dart';
import '../../widget/home/customSearch.dart';
import '../../widget/home/customYourProducts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImphomePageControoler());

    return GetBuilder<ImphomePageControoler>(
      builder: (controller) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              Customsearech(
                apperFavandNot: true,
                onchange: (val) {
                  controller.checkSearch(val);
                },
                onpressedfav: () {
                  Get.toNamed(AppRoutes.favorite);
                },
                mycontroller: controller.search2!,
                onpressedsearch: () async {
                  controller.onsearchitems();
                  await controller.search();
                },
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.issearch
                      ? Column(children: [
                          const Customoffers(),
                          Customyourtext(Title: "22".tr),
                          const Customcategories(),
                          const SizedBox(height: 10),
                          Customyourtext(Title: "45".tr),
                          const Customyourproducts(),
                          Customyourtext(Title: "24".tr),
                          const Customsales()
                        ])
                      : searchResult(itemmodel: controller.searchlist))
            ]));
      },
    );
  }
}
