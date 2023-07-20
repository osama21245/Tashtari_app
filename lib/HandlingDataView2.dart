import 'package:flutter/material.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';
import 'package:lottie/lottie.dart';
import 'package:woocommerce_app/core/constant/imgaeasset.dart';

// ignore: must_be_immutable
class HandlingDataView2 extends StatelessWidget {
  StatusRequest? statusRequest;
  Widget widget;
  HandlingDataView2(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Padding(
            padding: const EdgeInsets.only(top: 30),
            child: LottieBuilder.asset(
              AppImageAsset.loading,
              repeat: true,
            ),
          )
        : statusRequest == StatusRequest.offlinefaliure
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: LottieBuilder.asset(AppImageAsset.offline),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: LottieBuilder.asset(AppImageAsset.server),
                  )
                : statusRequest == StatusRequest.failure
                    ? Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: LottieBuilder.asset(AppImageAsset.nodata),
                      )
                    : widget;
  }
}
