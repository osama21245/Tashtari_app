import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';

import '../../../core/function/databaseTranslate.dart';

class CustomTitle extends GetView<ImpitemdetailsController> {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${databaseTranslate(controller.itemmodel!.itemsNameAr, controller.itemmodel!.itemsName)}",
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
