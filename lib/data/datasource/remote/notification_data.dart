import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class NotificatinData {
  Crud crud;

  NotificatinData(this.crud);

  getData(String? userid) async {
    var response =
        await crud.postData(Apilinks.linknotifivation, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String? userid) async {
    var response =
        await crud.postData(Apilinks.linkdeletenotfication, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
