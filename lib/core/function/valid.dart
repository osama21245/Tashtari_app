import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "is not a username";
    }
  }

  // if (type == "email") {
  //   if (!GetUtils.isEmail(val)) {
  //     return "is not a email";
  //   }
  // }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "is not a phone";
    }
  }

  if (val.isEmpty) {
    return "Value Can't Be Empty";
  }

  if (val.length < min) {
    return "Value Can't Be Less Than $min";
  }

  if (val.length > max) {
    return "Value Can't Be More Than $max";
  }
}
