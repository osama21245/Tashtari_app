import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/controller/onBoardingControoler.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<onBoardingControllerImp> {
  CustomSliderOnBoarding(this.size);
  Size size;
  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.getCurrentPage(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: size.width * 0.06),
                  child: Text("${onBoardingList[i].title!}",
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              Container(
                // margin: EdgeInsets.only(right: size.width * 0.1),
                child: Image.asset(
                  "${onBoardingList[i].image!}",
                  height: size.height * 0.23,
                  width: size.width * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "${onBoardingList[i].body!}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          );
        });
  }
}
