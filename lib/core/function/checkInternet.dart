import 'dart:io';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");

    if (result[0].rawAddress.isNotEmpty && result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    return false;
  }
}
