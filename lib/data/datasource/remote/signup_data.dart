import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postdata(String username, String email, String password, String phone) async {
    var response = await crud.postData(Apilinks.linksignup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
