class Apilinks {
  static const String linskServerName = "http://10.0.2.2/ecommerce2";
  static const String linkimageCategories =
      "http://10.0.2.2/ecommerce2/upload/categories";
  static const String linkimageItems =
      "http://10.0.2.2/ecommerce2/upload/items";

//===================== Auth ==================
  static const String linksignup = "$linskServerName/auth/signup.php";
  static const String linkslogin = "$linskServerName/auth/login.php";

  //===================ForgetPassword =====================

  static const String linkcheckemail =
      "$linskServerName/auth/forgetpassword/checkemail.php";
  static const String linkresetpassword =
      "$linskServerName/auth/forgetpassword/resetpassword.php";

  //==============Favourite=============================
  static const String linkaddfavorite = "$linskServerName/favorite/add.php";
  static const String linkdeletefavorite =
      "$linskServerName/favorite/delete.php";
  static const String linkviewfavorite = "$linskServerName/favorite/view.php";
  static const String linkdeleteitemfavorite =
      "$linskServerName/favorite/deleteitem.php";

//=====================

  static const String linkview = "$linskServerName/categories/view.php";
  static const String linkhome = "$linskServerName/home.php";
  static const String linkitem = "$linskServerName/item/items.php";

  //imagesCategories

  static const String linkcamera = "$linkimageCategories/camera.svg";
  static const String linkdress = "$linkimageCategories/dress.svg";
  static const String linkmobile = "$linkimageCategories/mobile.svg";
  static const String linklaptop = "$linkimageCategories/laptop.svg";
  static const String linkshose = "$linkimageCategories/shoes.svg";
}


// http://osamagamil.rf.gd/ecommerce2/item/