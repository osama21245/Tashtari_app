import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:woocommerce_app/controller/item/itemdetailsController.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../../controller/orders/ordersarchiveController.dart';

RatingBarItem(BuildContext context, String itemimageUrl, String itemname) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        itemname,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      // your app's logo?
      image: Image.network(itemimageUrl),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(color: AppColor.primaryColor),
      commentHint: "Tell us Your comments", starSize: 28,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ImpitemdetailsController controller = Get.find();

        controller.Rating = response.rating.toString();
        controller.update();
        // print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
      },
    ),
  );
}
