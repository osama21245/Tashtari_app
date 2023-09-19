import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';

import '../../../core/function/databaseTranslate.dart';
import '../../../core/function/rating_bar.dart';
import '../../../linksApi.dart';

class CustomChatTextField extends StatelessWidget {
  const CustomChatTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ImpitemdetailsController controller = Get.put(ImpitemdetailsController());
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: TextFormField(
        controller: controller.comment,
        decoration: InputDecoration(
          hintText: "131".tr,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Color.fromARGB(87, 156, 156, 156),
          contentPadding: EdgeInsets.all(20),
          prefixIcon: GetBuilder<ImpitemdetailsController>(
              builder: (c) => IconButton(
                  onPressed: () {
                    RatingBarItem(
                      context,
                      "${Apilinks.linkimageItems}/${controller.itemmodel!.itemsImage}",
                      databaseTranslate("${controller.itemmodel!.itemsNameAr}",
                          "${controller.itemmodel!.itemsName}"),
                    );
                  },
                  icon: controller.Rating != null
                      ? Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      : Icon(Icons.star_border_sharp))),
          suffixIcon: controller.isloading == false
              ? IconButton(
                  onPressed: () {
                    controller.rateItem();
                    controller.comment!.clear();
                    controller.Rating = null;
                  },
                  icon: Icon(Icons.send),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
