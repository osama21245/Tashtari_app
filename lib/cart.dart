import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/widget/cart/customCartButtonNavigationBar.dart';
import '../../../linksApi.dart';

import 'HandlingDataView.dart';
import 'controller/cartController.dart';
import 'view/widget/cart/customCartNumitems.dart';
import 'view/widget/cart/customCatCard.dart';
import 'view/widget/cart/customMyCartText.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpcartController());

    return Scaffold(
      bottomNavigationBar: GetBuilder<ImpcartController>(
        builder: (controller) => CustomBottomNavigationBar(
          onbuy: () {
            controller.gotocheckout();
          },
          oncoupon: () {
            controller.checkcoupon();
            FocusScope.of(context).unfocus();
          },
          coponcode: controller.coponcode,
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CustomMycarText(
            textname: "My Cart",
          ),
        ),
        GetBuilder<ImpcartController>(
            builder: (c) => CustomNuminCart(size: size)),
        GetBuilder<ImpcartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                        controller.cartViewitems.length,
                        (index) => CustomCartCard(
                          add: () async {
                            await controller.addtocart(controller
                                .cartViewitems[index].itemsId
                                .toString());
                            controller.refreshpage();
                          },
                          remove: () async {
                            await controller.deletefromcart(controller
                                .cartViewitems[index].itemsId
                                .toString());
                            controller.refreshpage();
                          },
                          image:
                              "${Apilinks.linkimageItems}/${controller.cartViewitems[index].itemsImage}",
                          price:
                              "${controller.cartViewitems[index].itemsprice}\$",
                          name: "${controller.cartViewitems[index].itemsName}",
                          count:
                              "${controller.cartViewitems[index].countitmes}",
                        ),
                      )
                    ],
                  ),
                ))
      ]),
    );
  }
}
