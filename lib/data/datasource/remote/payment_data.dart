import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class PaymentData {
  Crud crud;

  PaymentData(this.crud);

  getauthtoken(String key) async {
    var response =
        await crud.postDataPayment(Apilinks.getAuthToken, {"api_key": key});
    return response.fold((l) => l, (r) => r);
  }

  getid(String token) async {
    var response = await crud.postDataPayment(Apilinks.getOrderId, {
      "auth_token": "$token",
      "delivery_needed": "false",
      "amount_cents": "5000",
      "currency": "EGP",
      "items": []
    });
    return response.fold((l) => l, (r) => r);
  }

  getpayment(String orderPaymentid, String token, int integrationId) async {
    var response = await crud.postDataPayment(Apilinks.getPaymentRequest, {
      "auth_token": "$token",
      "amount_cents": "5000",
      "expiration": 3600,
      "order_id": "$orderPaymentid",
      "billing_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": integrationId,
      "lock_order_when_paid": "false"
    });
    return response.fold((l) => l, (r) => r);
  }

  kioskpayment(String token) async {
    var response = await crud.postDataPayment(Apilinks.getRefCode, {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": token
    });
    return response.fold((l) => l, (r) => r);
  }

  orderStatment(String url) async {
    var response = await crud.postDataPayment("$url/transaction-callback", {});
    return response.fold((l) => l, (r) => r);
  }
}
