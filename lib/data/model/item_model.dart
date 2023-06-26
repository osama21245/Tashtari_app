class Itemmodel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemspricediscount;

  Itemmodel(
      {this.itemsId,
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
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite,
      this.itemspricediscount});

  Itemmodel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemspricediscount = json['itemspricediscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    data['itemspricediscount'] = this.itemspricediscount;
    return data;
  }
}
