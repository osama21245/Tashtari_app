import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class ResetpasswordData {
  Crud crud;

  ResetpasswordData(this.crud);

  getData(String email, String password) async {
    var response = await crud.postData(
        Apilinks.linkresetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
