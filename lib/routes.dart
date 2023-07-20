import 'package:get/get.dart';
import 'package:woocommerce_app/cart.dart';
import 'package:woocommerce_app/core/constant/routesname.dart';
import 'package:woocommerce_app/favorite.dart';
import 'package:woocommerce_app/settings.dart';
import 'package:woocommerce_app/view/screen/address/view.dart';
import 'package:woocommerce_app/view/screen/orders/ordersdetails.dart';
import 'package:woocommerce_app/view/screen/orders/pending.dart';
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
import 'core/middleWare/myMiddleWare.dart';
import 'notifications.dart';
import 'view/screen/address/add.dart';
import 'view/screen/orders/archived.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [myMiddlware()]),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.signup, page: () => const Signup()),
  GetPage(name: AppRoutes.homemain, page: () => const Homemain()),
  GetPage(name: AppRoutes.homepage, page: () => const Home()),
  GetPage(name: AppRoutes.itemmain, page: () => itemmain()),
  GetPage(name: AppRoutes.checkemail, page: () => const Checkemail()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.sucsessresetPassword,
      page: () => const sucessResetPassword()),
  GetPage(name: AppRoutes.sucsessSignup, page: () => const sucessSignup()),
  GetPage(
      name: AppRoutes.signupverifyCode, page: () => const signupVerifyCode()),
  GetPage(name: AppRoutes.itemdetails, page: () => itemdetails()),
  GetPage(name: AppRoutes.favorite, page: () => const Favorite()),
  GetPage(name: AppRoutes.settings, page: () => const Settings()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.addressadd, page: () => const Addressadd()),
  GetPage(name: AppRoutes.addressview, page: () => const Address()),
  GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.Orderspending, page: () => const Orderspending()),
  GetPage(name: AppRoutes.OrdersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.Orderarchive, page: () => const Orderarchive()),
  GetPage(name: AppRoutes.Notifications, page: () => const Notifications()),
];
