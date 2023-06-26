import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  add(String userid, String itemid) async {
    var response = await crud
        .postData(Apilinks.linkaddcart, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  delete(String userid, String itemid) async {
    var response = await crud.postData(
        Apilinks.linkdeletecart, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  countitem(String userid, String itemid) async {
    var response = await crud
        .postData(Apilinks.linkcountitem, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  view(String userid) async {
    var response =
        await crud.postData(Apilinks.linkviewcart, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String name) async {
    var response =
        await crud.postData(Apilinks.linkcheckcoupon, {"couponname": name});
    return response.fold((l) => l, (r) => r);
  }
}
