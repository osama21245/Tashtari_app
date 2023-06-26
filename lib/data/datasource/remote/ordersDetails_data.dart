import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  finddata(
    String usersid,
  ) async {
    var response = await crud.postData(Apilinks.linkordersdetails, {
      "id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
