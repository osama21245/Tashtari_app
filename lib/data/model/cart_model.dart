class CartModel {
  String? itemsprice;
  String? countitmes;
  String? cartId;
  String? cartUsersid;
  String? cartItemid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescriptiom;
  String? itemsDecriptiomAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemspricediscount;
  String? itemsDiscount;
  String? itemsDate;
  String? itmesCat;
  String? itemsImage;

  CartModel(
      {this.itemsprice,
      this.countitmes,
      this.cartId,
      this.cartUsersid,
      this.cartItemid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescriptiom,
      this.itemsDecriptiomAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemspricediscount,
      this.itemsDiscount,
      this.itemsDate,
      this.itmesCat,
      this.itemsImage});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitmes = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemid = json['cart_itemid'];
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
    // itemspricediscount = json['itemspricediscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitmes;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemid'] = this.cartItemid;
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
    return data;
  }
}
