import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/HandlingDataView.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';

import '../../../controller/address/viewController.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/address_model.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpadressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed(AppRoutes.addressadd);
        },
        backgroundColor: AppColor.primaryColor,
      ),
      appBar: AppBar(
        title: Text("91".tr),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ImpadressViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(top: 13.0, left: 4, right: 4),
                child: ListView.builder(
                    itemCount: controller.dataAdress.length,
                    itemBuilder: (context, index) => CardAdress(
                          addressModel: controller.dataAdress[index],
                          onpressed: () {
                            controller
                                .delete(controller.dataAdress[index].addressId);
                          },
                        )),
              ))),
    );
  }
}

class CardAdress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onpressed;

  const CardAdress({super.key, required this.addressModel, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpadressViewController>(
        builder: (controller) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: ListTile(
                  trailing: IconButton(
                      onPressed: onpressed,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      )),
                  title: Text("${addressModel.addressName}"),
                  subtitle: Text("${addressModel.addressCity}" +
                      ". ${addressModel.addressStreet}"),
                ),
              ),
            ));
  }
}
