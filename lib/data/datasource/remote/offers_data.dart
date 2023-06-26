import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData(String userid) async {
    var response =
        await crud.postData(Apilinks.linkoffers, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
