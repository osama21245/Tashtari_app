import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';

import '../../../HandlingDataView.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/databaseTranslate.dart';
import '../../../core/function/showrating.dart';
import '../../../core/function/uploadfile.dart';
import '../../../linksApi.dart';
import '../../widget/itemdetails/CustomAiChatTextField.dart';
import '../../widget/itemdetails/CustomAiMessage.dart';
import '../../widget/itemdetails/color_dot.dart';

class itemdetails extends GetView<ImpitemdetailsController> {
  const itemdetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpitemdetailsController());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secoundColor,
          onPressed: () {
            ShowBottomMenu(size);
          },
          child: Icon(Icons.star_border_outlined),
        ),
        backgroundColor: Color.fromARGB(255, 241, 234, 241),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 241, 234, 241),
          leading: const BackButton(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  "assets/images/Heart.svg",
                  height: 20,
                ),
              ),
            )
          ],
        ),
        body: GetBuilder<ImpitemdetailsController>(
            builder: (c) => HandlingDataView(
                  statusRequest: c.statusRequest,
                  widget: Column(
                    children: [
                      Hero(
                        tag: "${controller.itemmodel!.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Apilinks.linkimageItems}/${controller.itemmodel!.itemsImage}",
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: AppColor.defaultPadding * 1.5),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(
                              AppColor.defaultPadding,
                              AppColor.defaultPadding * 2,
                              AppColor.defaultPadding,
                              AppColor.defaultPadding),
                          decoration: BoxDecoration(
                            color: myservices.sharedPreferences
                                        .getBool("isDarkMode") ==
                                    true
                                ? Color.fromARGB(92, 0, 0, 0)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppColor.defaultBorderRadius * 3),
                              topRight: Radius.circular(
                                  AppColor.defaultBorderRadius * 3),
                            ),
                          ),
                          child: ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        databaseTranslate(
                                            "${controller.itemmodel!.itemsNameAr}",
                                            "${controller.itemmodel!.itemsName}"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                    const SizedBox(
                                        width: AppColor.defaultPadding),
                                    Text(
                                      "\$ ${controller.itemmodel!.itemsPrice}",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppColor.defaultPadding),
                                child: Text(
                                  "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                                ),
                              ),
                              Text(
                                "Colors",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                  height: AppColor.defaultPadding / 2),
                              Row(
                                children: const [
                                  ColorDot(
                                    color: Color(0xFFBEE8EA),
                                    isActive: false,
                                  ),
                                  ColorDot(
                                    color: Color(0xFF141B4A),
                                    isActive: true,
                                  ),
                                  ColorDot(
                                    color: Color(0xFFF4E5C3),
                                    isActive: false,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: AppColor.defaultPadding * 3),
                              Center(
                                child: SizedBox(
                                  width: size.width * 0.95,
                                  height: size.height * 0.05,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.counterIncress(
                                          controller.itemmodel!.itemsId!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: myservices
                                                  .sharedPreferences
                                                  .getBool("isDarkMode") ==
                                              true
                                          ? Color.fromARGB(0, 44, 44, 44)
                                          : AppColor.secoundColor,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("52".tr),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Icon(Icons.add_shopping_cart_sharp)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
