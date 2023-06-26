class OrdersModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemid;
  String? cartOrders;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescriptiom;
  String? itemsDecriptiomAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itmesCat;
  String? itemsImage;
  String? ordersId;
  String? ordersUsersid;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersTotalprice;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersAddress;
  String? ordersPaymenttype;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;

  OrdersModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemid,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescriptiom,
      this.itemsDecriptiomAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itmesCat,
      this.itemsImage,
      this.ordersId,
      this.ordersUsersid,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersTotalprice,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersAddress,
      this.ordersPaymenttype,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemid = json['cart_itemid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescriptiom = json['items_descriptiom'];
    itemsDecriptiomAr = json['items_decriptiom_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itmesCat = json['itmes_cat'];
    itemsImage = json['items_image'];
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersTotalprice = json['orders_totalprice'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersAddress = json['orders_address'];
    ordersPaymenttype = json['orders_paymenttype'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemid'] = this.cartItemid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_descriptiom'] = this.itemsDescriptiom;
    data['items_decriptiom_ar'] = this.itemsDecriptiomAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['itmes_cat'] = this.itmesCat;
    data['items_image'] = this.itemsImage;
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_address'] = this.ordersAddress;
    data['orders_paymenttype'] = this.ordersPaymenttype;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    return data;
  }
}
