import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(Apilinks.linkview, {});
    return response.fold((l) => l, (r) => r);
  }
}
