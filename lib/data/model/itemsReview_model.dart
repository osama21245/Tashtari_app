class ItemsReviewModel {
  String? reviewId;
  String? reviewComment;
  String? reviewRate;
  String? reviewItem;
  String? reviewUser;
  String? reviewDate;
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
  String? items3d;
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerifycode;
  String? usersApprove;
  String? usersCreate;

  ItemsReviewModel(
      {this.reviewId,
      this.reviewComment,
      this.reviewRate,
      this.reviewItem,
      this.reviewUser,
      this.reviewDate,
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
      this.items3d,
      this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPassword,
      this.usersPhone,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate});

  ItemsReviewModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    reviewComment = json['review_comment'];
    reviewRate = json['review_rate'];
    reviewItem = json['review_item'];
    reviewUser = json['review_user'];
    reviewDate = json['review_date'];
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
    items3d = json['items_3d'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['review_comment'] = this.reviewComment;
    data['review_rate'] = this.reviewRate;
    data['review_item'] = this.reviewItem;
    data['review_user'] = this.reviewUser;
    data['review_date'] = this.reviewDate;
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
    data['items_3d'] = this.items3d;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    return data;
  }
}
