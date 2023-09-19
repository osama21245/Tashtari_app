import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class itemDetailsData {
  Crud crud;

  itemDetailsData(this.crud);

  getreviews(String itemid, String usersid) async {
    var response =
        await crud.postData(Apilinks.linkreview, {"itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addreviews(String itemid, String usersid, String comment, String rate) async {
    var response = await crud.postData(Apilinks.linkaddreview, {
      "itemid": itemid.toString(),
      "userid": usersid.toString(),
      "comment": comment.toString(),
      "rating": rate.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
