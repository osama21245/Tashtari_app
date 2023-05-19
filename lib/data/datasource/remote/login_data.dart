import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postdata(
    String email,
    String password,
  ) async {
    var response = await crud.postData(Apilinks.linkslogin, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
