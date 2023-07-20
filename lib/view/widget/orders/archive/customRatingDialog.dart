import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:woocommerce_app/core/constant/color.dart';

import '../../../../controller/orders/ordersarchiveController.dart';

showdialogRating(BuildContext context, String orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset("assets/images/tashtari-logo.png"),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(color: AppColor.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ImporderArchiveController controller = Get.find();

        controller.rating(
            orderid, response.rating.toString(), response.comment);
        // print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
      },
    ),
  );
}
