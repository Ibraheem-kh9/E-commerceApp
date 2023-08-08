import 'package:e_commerce_app/utils/constants/app_routes.dart';
import 'package:e_commerce_app/view/screens/auth_screens/forgot_password/confirm_reset_password_sc.dart';
import 'package:e_commerce_app/view/screens/auth_screens/forgot_password/otp_code_sc.dart';
import 'package:e_commerce_app/view/screens/auth_screens/login_page_sc.dart';
import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/screens/checkEmailVerifyedOrNotSc.dart';
import 'package:e_commerce_app/view/screens/favorite_item_sc.dart';
import 'package:e_commerce_app/view/screens/item_detail_order_sc.dart';
import 'package:e_commerce_app/view/screens/items_categories_sc.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/change_language_sc.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/setting_sc.dart';
import 'package:e_commerce_app/view/screens/onboarding_sc.dart';
import 'package:e_commerce_app/view/screens/wrapper_page_sc.dart';
import 'package:flutter/cupertino.dart';
import '../../view/screens/auth_screens/forgot_password/forgot_password_sc.dart';
import '../../view/screens/auth_screens/forgot_password/reset_password_sc.dart';
import '../../view/screens/auth_screens/register_email_verified_sc.dart';
import '../../view/screens/auth_screens/register_page_sc.dart';
import '../../view/screens/homepage_sc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.wrapperPage: (context) => const WrapperPageSc(),
  AppRoute.onBoarding: (context) => const OnBoardingSc(),
  AppRoute.login: (context) => const LoginSc(),
 // AppRoute.checkEmailVerifiedOrNot: (context) => const CheckEmailVerifiedOrNot(),
  AppRoute.register: (context) => const RegisterPageSc(),
  AppRoute.signInEmailVerified: (context) => const RegisterEmailVerifiedSc(),
  AppRoute.otpPage: (context) => const OtpCodeSc(),
  AppRoute.resetPassPage: (context) => const ResetPasswordSc(),
  AppRoute.confirmPassPage: (context) => const ConfirmResetPasswordSc(),
  AppRoute.forgotPassPage: (context) => const ForgetPasswordSc(),
  AppRoute.homePage: (context) => HomepageSc(),
  AppRoute.favorite: (context) => const FavoriteItemSc(),
  AppRoute.cart: (context) => const CartSc(),
  AppRoute.categories: (context) => const ItemsCategoriesSc(),
  AppRoute.setting: (context) => const SettingSc(),
  AppRoute.itemDetails: (context) => const ItemDetailOrderSc(),
  AppRoute.language: (context) => const ChangeLanguageSc(),
};
