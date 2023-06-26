import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getData(
    String usersid,
  ) async {
    var response = await crud.postData(Apilinks.linkorderspending, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String id,
  ) async {
    var response = await crud.postData(Apilinks.linkordersdelete, {
      "orderid": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
