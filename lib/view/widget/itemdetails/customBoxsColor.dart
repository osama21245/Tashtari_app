import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/item/itemdetailsController.dart';
import '../../../core/constant/color.dart';

class CustomBoxsColor extends StatelessWidget {
  const CustomBoxsColor({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Row(
        children: [
          GetBuilder<ImpitemdetailsController>(
            builder: (controller) {
              return InkWell(
                onTap: () {
                  controller.changestate(0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),
                  alignment: Alignment.center,
                  height: size.height * 0.085,
                  width: size.width * 0.22,
                  decoration: BoxDecoration(
                      color: controller.state == 0
                          ? AppColor.secoundColor
                          : Colors.white,
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 119, 117, 117)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "purble",
                    style: TextStyle(
                        color:
                            controller.state == 0 ? Colors.white : Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          GetBuilder<ImpitemdetailsController>(
            builder: (controller) {
              return InkWell(
                onTap: () {
                  controller.changestate(1);
                },
                child: Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),
                  alignment: Alignment.center,
                  height: size.height * 0.085,
                  width: size.width * 0.22,
                  decoration: BoxDecoration(
                      color: controller.state == 1
                          ? AppColor.secoundColor
                          : Colors.white,
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 119, 117, 117)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "blue",
                    style: TextStyle(
                        color:
                            controller.state == 1 ? Colors.white : Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          GetBuilder<ImpitemdetailsController>(
            builder: (controller) {
              return InkWell(
                onTap: () {
                  controller.changestate(2);
                },
                child: Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),
                  alignment: Alignment.center,
                  height: size.height * 0.085,
                  width: size.width * 0.22,
                  decoration: BoxDecoration(
                      color: controller.state == 2
                          ? AppColor.secoundColor
                          : Colors.white,
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 119, 117, 117)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Red",
                    style: TextStyle(
                        color:
                            controller.state == 2 ? Colors.white : Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
