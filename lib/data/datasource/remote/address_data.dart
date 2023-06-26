import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  add(String userid, String addressname, String addresscity,
      String addressStreet) async {
    var response = await crud.postData(Apilinks.linkaddaddress, {
      "addressusersid": userid,
      "addressname": addressname,
      "adresscity": addresscity,
      "adressStreet": addressStreet
    });
    return response.fold((l) => l, (r) => r);
  }

  update(String userid, String addressname, String addresscity,
      String addressStreet) async {
    var response = await crud.postData(Apilinks.linkupdateaddress, {
      "addressusersid": userid,
      "addressname": addressname,
      "adresscity": addresscity,
      "adressStreet": addressStreet
    });
    return response.fold((l) => l, (r) => r);
  }

  delete(String addressid) async {
    var response = await crud
        .postData(Apilinks.linkdeleteaddress, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  view(String userid) async {
    var response =
        await crud.postData(Apilinks.linkviewaddress, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
