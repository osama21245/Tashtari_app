import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class VerifycodeData {
  Crud crud;

  VerifycodeData(this.crud);

  SendverifyCode(
    String verifycode,
    String email,
  ) async {
    var response = await crud.postData(Apilinks.linksverifycode, {
      "verifycode": verifycode,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendVerifyCode(
    String verifycode,
    String email,
  ) async {
    var response = await crud.postData(Apilinks.linksReSendVerifyCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  Sendforcheckemail(
    String verifycode,
    String userid,
  ) async {
    var response = await crud.postData(Apilinks.linkcheckemailverifyCode, {
      "verifycode": verifycode,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
