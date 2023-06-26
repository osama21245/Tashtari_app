import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(Apilinks.linkhome, {});
    return response.fold((l) => l, (r) => r);
  }

  search(String search) async {
    var response = await crud.postData(Apilinks.linksearch, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
