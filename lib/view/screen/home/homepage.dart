import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/home/homeControoler.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/favouriteController.dart';
import '../../../data/datasource/static/APIs/woocommere_api.dart';
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
    Size size = MediaQuery.of(context).size;

    Get.put(ImphomePageControoler());

    return GetBuilder<ImphomePageControoler>(
      builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    Customsearech(
                      onpressedfav: () {
                        Get.toNamed(AppRoutes.favorite);
                      },
                    ),
                    const Customoffers(),
                    Customyourtext(Title: "22".tr),
                    const Customcategories(),
                    const SizedBox(height: 10),
                    Customyourtext(Title: "23".tr),
                    const Customyourproducts(),
                    Customyourtext(Title: "24".tr),
                    const Customsales()
                  ],
                )));
      },
    );
  }
}
