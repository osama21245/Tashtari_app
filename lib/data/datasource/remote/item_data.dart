import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class itemData {
  Crud crud;

  itemData(this.crud);

  getData(String id, String usersid) async {
    var response = await crud.postData(Apilinks.linkitem,
        {"id": id.toString(), "usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
