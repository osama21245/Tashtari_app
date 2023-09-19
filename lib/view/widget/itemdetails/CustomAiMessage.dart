import 'package:woocommerce_app/core/function/databaseTranslate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/item/itemdetailsController.dart';
import '../../../core/function/showrating.dart';

class CustomMessage extends GetView<ImpitemdetailsController> {
  const CustomMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.03, horizontal: size.width * 0.04),
      child: Container(
        height: size.height * 0.22,
        width: size.width * 0.85,
        child: ListView.builder(
            shrinkWrap: true,
            reverse: false,
            itemCount: controller.reviews.length,
            itemBuilder: (context, index) => myservices.sharedPreferences
                        .getString("lang") ==
                    "en"
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      constraints: BoxConstraints(maxWidth: size.width * 0.66),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 104, 104, 104),
                                child: Image.asset(
                                  "assets/images/th-removebg-preview.png",
                                  color: Colors.white,
                                  width: size.width * 0.03,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(controller.reviews[index].usersName!,
                                  style: TextStyle(
                                      fontFamily: "PlayfairDisplay",
                                      fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              RatingDisplayWidget(
                                rating: controller.reviews[index].reviewRate ==
                                        null
                                    ? 0.0
                                    : double.parse(
                                        controller.reviews[index].reviewRate!),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              double.parse(controller
                                          .reviews[index].reviewRate!) >
                                      3
                                  ? Text(
                                      "Excellent",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Good",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Text(
                            "Reviewed in Egypt on ${controller.reviews[index].reviewDate}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Text(
                            controller.reviews[index].reviewComment!,
                            style:
                                TextStyle(fontFamily: "Gordita", fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      constraints: BoxConstraints(maxWidth: size.width * 0.66),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 104, 104, 104),
                                child: Image.asset(
                                  "assets/images/th-removebg-preview.png",
                                  color: Colors.white,
                                  width: size.width * 0.03,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(controller.reviews[index].usersName!,
                                  style: TextStyle(
                                      fontFamily: "PlayfairDisplay",
                                      fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              RatingDisplayWidget(
                                rating: controller.reviews[index].reviewRate ==
                                        null
                                    ? 0.0
                                    : double.parse(
                                        controller.reviews[index].reviewRate!),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              double.parse(controller
                                          .reviews[index].reviewRate!) >
                                      3
                                  ? Text(
                                      "Excellent",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Good",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Text(
                            "Reviewed in Egypt on ${controller.reviews[index].reviewDate}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Text(
                            controller.reviews[index].reviewComment!,
                            style:
                                TextStyle(fontFamily: "Gordita", fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }
}
