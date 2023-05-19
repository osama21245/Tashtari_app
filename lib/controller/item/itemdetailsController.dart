import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/itemmodel.dart';

class itemdetailsController extends GetxController {
  Itemmodel? itemmodel;

  int? counter = 1;
  int? state = 0;
  int? price2;

  changeprice(int? price) {}
  counterIncress() {}
  counter0() {}
  changestate(int i) {}
}

class ImpitemdetailsController extends itemdetailsController {
  @override
  changestate(i) {
    state = i;
    update();
  }

  changeprice(price) {
    price2 = price! * counter!;
    update();
  }

  counterIncress() {
    counter = (counter! + 1);
    update();
  }

  counterdecress() {
    counter = (counter! - 1);
    update();
  }

  @override
  void onInit() {
    itemmodel = Get.arguments["itemsmodel"];
    price2 = itemmodel!.itemsPrice;
    // changeprice(price) {
    //   price2 = price! * counter!;
    //   update();
    // }

    super.onInit();
  }
}
