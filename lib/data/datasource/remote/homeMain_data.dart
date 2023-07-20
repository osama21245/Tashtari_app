import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class HomeMainData {
  Crud crud;

  HomeMainData(this.crud);

  getData(String? userid) async {
    var response =
        await crud.postData(Apilinks.linknotifivation, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
