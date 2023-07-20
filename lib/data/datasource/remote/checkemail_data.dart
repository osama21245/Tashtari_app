import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CheckemailData {
  Crud crud;

  CheckemailData(this.crud);

  getData(String email) async {
    var response =
        await crud.postData(Apilinks.linkcheckemailGetData, {"email": email});
    return response.fold((l) => l, (r) => r);
  }

  postData(String email, String userid) async {
    var response = await crud
        .postData(Apilinks.linkcheckemail, {"email": email, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
