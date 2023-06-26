import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  getData(
      String usersid,
      String address,
      String payment,
      String delivery,
      String deliveryprice,
      String orderprice,
      String coupon,
      String priceBe) async {
    var response = await crud.postData(Apilinks.linkorderscheckout, {
      "usersid": usersid,
      "ordersaddress": address,
      "orderstype": delivery,
      "pricedelivery": deliveryprice,
      "ordersprice": orderprice,
      "orderscoupon": coupon,
      "orderspaymenttype": payment,
      "orders_priceBe": priceBe
    });
    return response.fold((l) => l, (r) => r);
  }
}
