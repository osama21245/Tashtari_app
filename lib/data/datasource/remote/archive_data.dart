import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class ArchiveData {
  Crud crud;

  ArchiveData(this.crud);

  getData(
    String usersid,
  ) async {
    var response = await crud.postData(Apilinks.linkordersarchive, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rating(String id, String rating, String note) async {
    var response = await crud.postData(
        Apilinks.linkrating, {"id": id, "rating": rating, "note": note});
    return response.fold((l) => l, (r) => r);
  }
}
