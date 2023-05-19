import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  add(String userid, String itemid) async {
    var response = await crud.postData(
        Apilinks.linkaddfavorite, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  delete(String userid, String itemid) async {
    var response = await crud.postData(
        Apilinks.linkdeletefavorite, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  view(String userid) async {
    var response = await crud.postData(Apilinks.linkviewfavorite, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteitem(String id) async {
    var response = await crud.postData(Apilinks.linkdeleteitemfavorite, {
      "favid": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
