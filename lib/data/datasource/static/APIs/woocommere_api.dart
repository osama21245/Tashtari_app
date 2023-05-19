// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

import '../../../../const.dart';

class Woocommerce_r {
  String? email;
  String? password;

  Future getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
      url: "$tashtari",
      consumerKey: "$consumerKey_local",
      consumerSecret: "$consumerSecret_local",
    );

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");

    return products;
  }

  Future createCustomer(var email, var password) async {
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
      url: "$tashtari",
      consumerKey: "$consumerKey_local",
      consumerSecret: "$consumerSecret_local",
    );

    try {
      var response = await wooCommerceAPI.postAsync(
        "customers",
        {
          "email": '$email',
          "password": "$password",
          "billing": {
            "first_name": "Samarth",
          }
        },
      );
      print(response); // JSON Object with response
    } catch (e) {
      print(e);
    }
  }
}
