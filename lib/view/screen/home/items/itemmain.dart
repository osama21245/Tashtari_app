import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/core/constant/color.dart';
import 'package:woocommerce_app/data/model/itemmodel.dart';
import 'package:woocommerce_app/view/screen/home/items/itemdatails/itemdetails.dart';
import 'package:woocommerce_app/view/widget/home/customSearch.dart';
import 'package:woocommerce_app/view/widget/homeMain/item/customCategoriesitem.dart';

import '../../../../HandlingDataView.dart';
import '../../../../HandlingDataView2.dart';
import '../../../../controller/favouriteController.dart';
import '../../../../controller/item/itemControoler.dart';
import '../../../../data/datasource/static/APIs/woocommere_api.dart';
import '../../../../data/model/iconlistmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../linksApi.dart';
import '../../../widget/homeMain/item/customitems.dart';

class itemmain extends StatelessWidget {
  dynamic katindex;
  itemmain({super.key, this.katindex});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpitemControoler());
    ImpfavourateController controllerfav = Get.put(ImpfavourateController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Customsearech(
              onpressedfav: () {},
            ),
            Customcategoriesitem(
              katindex: katindex,
            ),
            GetBuilder<ImpitemControoler>(
                builder: (c) => HandlingDataView2(
                      statusRequest: c.statusRequest,
                      widget: GridView.builder(
                          itemCount: c.items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.66, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, i) {
                            controllerfav.isFavorite[c.items[i]["items_id"]] =
                                c.items[i]["favorite"];
                            return Customitems(
                              itemmodel: Itemmodel.fromJson(c.items[i]),
                            );
                          }),
                    ))
          ],
        ),
      ),
    );
  }
}
