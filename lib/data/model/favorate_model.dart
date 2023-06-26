class Favoritemodel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemid;
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
  String? usersId;
  Favoritemodel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemid,
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
      this.usersId});

  Favoritemodel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemid = json['favorite_itemid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemid'] = this.favoriteItemid;
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
    data['users_id'] = this.usersId;
    return data;
  }
}
