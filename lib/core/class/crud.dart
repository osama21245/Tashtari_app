import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:woocommerce_app/core/class/statusrequest.dart';
import 'package:woocommerce_app/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

String _basicAuth = 'Basic ' + base64Encode(utf8.encode("*******"));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(link), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefaliure);
      }
    } catch (e) {
      return left(StatusRequest.e);
    }
  }
}
