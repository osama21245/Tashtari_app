import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/widget/favorite/Customefavoritecard.dart';
import 'package:woocommerce_app/view/widget/home/CustomSearchResult.dart';
import 'package:woocommerce_app/view/widget/home/customSearch.dart';

import 'HandlingDataView.dart';
import 'controller/favouriteController.dart';
import 'core/function/databaseTranslate.dart';
import 'linksApi.dart';

class Favorite extends GetView<ImpfavourateController> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpfavourateController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GetBuilder<ImpfavourateController>(
            builder: (controller) => Container(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8),
                        child: Customsearech(
                          apperFavandNot: false,
                          onchange: (val) {
                            controller.checkSearch(val);
                          },
                          onpressedfav: () {},
                          mycontroller: controller.search2!,
                          onpressedsearch: () async {
                            controller.onsearchitems();
                            await controller.search();
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: !controller.issearch
                              ? GridView.builder(
                                  itemCount: controller.data.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 3.3,
                                          crossAxisCount: 1),
                                  itemBuilder: (BuildContext context, i) {
                                    return CustomfavoriteCard(
                                      image: Apilinks.linkimageItems +
                                          "/" +
                                          controller.data[i].itemsImage!,
                                      title: databaseTranslate(
                                          "${controller.data[i].itemsNameAr}",
                                          "${controller.data[i].itemsName}"),
                                      subtitle:
                                          "\$ ${controller.data[i].itemsPrice}",
                                      ondelete: () async {
                                        await controller.deleteitemfromFav(
                                            controller.data[i].favoriteId
                                                .toString());
                                        controller.refreshpage();
                                      },
                                      size: size,
                                    );
                                  })
                              : searchResult(
                                  itemmodel: controller.searchlist,
                                ))
                    ],
                  ),
                )));
  }
}
