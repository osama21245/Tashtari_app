import 'package:get/get.dart';
import 'package:woocommerce_app/cart.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/favorite.dart';
import 'package:woocommerce_app/settings.dart';
import 'package:woocommerce_app/view/address/view.dart';
import 'package:woocommerce_app/view/orders/ordersdetails.dart';
import 'package:woocommerce_app/view/orders/pending.dart';
import 'package:woocommerce_app/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:woocommerce_app/view/screen/auth/logIn.dart';
import 'package:woocommerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:woocommerce_app/view/screen/auth/signup.dart';
import 'package:woocommerce_app/view/screen/auth/forgetpassword/sucsessResetPassword.dart';
import 'package:woocommerce_app/view/screen/auth/signupVerifyCode.dart';
import 'package:woocommerce_app/view/screen/auth/sucsessSignup.dart';
import 'package:woocommerce_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:woocommerce_app/view/screen/home/homepaemain.dart';
import 'package:woocommerce_app/view/screen/home/homepage.dart';
import 'package:woocommerce_app/view/screen/itemdatails/itemdetails.dart';
import 'package:woocommerce_app/view/screen/items/itemmain.dart';
import 'package:woocommerce_app/view/screen/language.dart';
import 'package:woocommerce_app/view/screen/onboarding.dart';

import 'checkout.dart';
import 'view/address/add.dart';
import 'view/orders/archived.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => Homemain(),
  ),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.onboarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signup, page: () => Signup()),
  GetPage(name: AppRoutes.homemain, page: () => Homemain()),
  GetPage(name: AppRoutes.homepage, page: () => Home()),
  GetPage(name: AppRoutes.itemmain, page: () => itemmain()),
  GetPage(name: AppRoutes.checkemail, page: () => Checkemail()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => VerifyCode()),
  GetPage(
      name: AppRoutes.sucsessresetPassword, page: () => sucessResetPassword()),
  GetPage(name: AppRoutes.sucsessSignup, page: () => sucessSignup()),
  GetPage(name: AppRoutes.signupverifyCode, page: () => signupVerifyCode()),
  GetPage(name: AppRoutes.itemdetails, page: () => itemdetails()),
  GetPage(name: AppRoutes.favorite, page: () => Favorite()),
  GetPage(name: AppRoutes.settings, page: () => Settings()),
  GetPage(name: AppRoutes.cart, page: () => Cart()),
  GetPage(name: AppRoutes.addressadd, page: () => Addressadd()),
  GetPage(name: AppRoutes.addressview, page: () => Address()),
  GetPage(name: AppRoutes.checkout, page: () => Checkout()),
  GetPage(name: AppRoutes.Orderspending, page: () => Orderspending()),
  GetPage(name: AppRoutes.OrdersDetails, page: () => OrdersDetails()),
  GetPage(name: AppRoutes.Orderarchive, page: () => Orderarchive()),
];
