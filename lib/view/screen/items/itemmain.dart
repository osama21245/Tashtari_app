import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/data/model/item_model.dart';
import 'package:woocommerce_app/view/widget/home/customSearch.dart';
import 'package:woocommerce_app/view/widget/item/customCategoriesitem.dart';

import '../../../HandlingDataView2.dart';
import '../../../controller/favouriteController.dart';
import '../../../controller/item/itemControoler.dart';

import '../../../core/constant/routesname.dart';
import '../../widget/home/CustomSearchResult.dart';
import '../../widget/item/customitems.dart';

// ignore: must_be_immutable
class itemmain extends GetView<ImpitemControoler> {
  dynamic katindex;
  itemmain({super.key, this.katindex});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpitemControoler());
    ImpfavourateController controllerfav = Get.put(ImpfavourateController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Customsearech(
              apperFavandNot: false,
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
            Customcategoriesitem(
              katindex: katindex,
            ),
            GetBuilder<ImpitemControoler>(
                builder: (c) => HandlingDataView2(
                    statusRequest: c.statusRequest,
                    widget: !controller.issearch
                        ? Column(
                            children: [
                              GridView.builder(
                                  itemCount: c.items.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.54,
                                          crossAxisCount: 2),
                                  itemBuilder: (BuildContext context, i) {
                                    controllerfav.isFavorite[c.items[i]
                                        ["items_id"]] = c.items[i]["favorite"];
                                    return Customitems(
                                      itemmodel: Itemmodel.fromJson(c.items[i]),
                                    );
                                  })
                            ],
                          )
                        : searchResult(
                            itemmodel: c.searchlist,
                          )))
          ],
        ),
      ),
    );
  }
}
