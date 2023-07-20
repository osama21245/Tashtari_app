import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/services/services.dart';

class Customsearech extends StatelessWidget {
  final void Function()? onpressedfav;
  final void Function()? onpressedsearch;
  final TextEditingController mycontroller;
  final void Function(String)? onchange;
  final bool apperFavandNot;

  const Customsearech(
      {super.key,
      required this.onpressedfav,
      this.onchange,
      this.onpressedsearch,
      required this.mycontroller,
      required this.apperFavandNot});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onchange,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onpressedsearch,
              ),
              hintText: "26".tr,
              hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: "PlayfairDisplay",
                  color:
                      myServices.sharedPreferences.getBool("isDarkMode") == true
                          ? const Color.fromARGB(255, 245, 244, 244)
                          : null),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor:
                  myServices.sharedPreferences.getBool("isDarkMode") == true
                      ? const Color.fromARGB(255, 153, 152, 152)
                      : Colors.grey[200]),
        )),
        if (apperFavandNot == true) const SizedBox(width: 10),
        if (apperFavandNot == true)
          Container(
            decoration: BoxDecoration(
                color:
                    myServices.sharedPreferences.getBool("isDarkMode") == true
                        ? const Color.fromARGB(255, 153, 152, 152)
                        : Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            height: 67,
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onpressedfav,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color:
                      myServices.sharedPreferences.getBool("isDarkMode") == true
                          ? const Color.fromARGB(255, 226, 225, 225)
                          : Colors.grey[600],
                )),
          )
      ]),
    );
  }
}
