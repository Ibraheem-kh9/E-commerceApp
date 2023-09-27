import 'package:e_commerce_app/view/screens/auth_screens/forgot_password/confirm_reset_password_sc.dart';
import 'package:e_commerce_app/view/screens/auth_screens/login_page_sc.dart';
import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/screens/favorite_item_sc.dart';
import 'package:e_commerce_app/view/screens/item_category_sc.dart';
import 'package:e_commerce_app/view/screens/order_item_sc.dart';
import 'package:e_commerce_app/view/screens/categories_sc.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/change_language_sc.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/setting_sc.dart';
import 'package:e_commerce_app/view/screens/onboarding_sc.dart';
import 'package:e_commerce_app/view/screens/wrapper_page_sc.dart';
import 'package:flutter/cupertino.dart';
import '../../../view/coming_soon_sc.dart';
import '../../../view/screens/auth_screens/forgot_password/forgot_password_sc.dart';
import '../../../view/screens/auth_screens/forgot_password/reset_password_sc.dart';
import '../../../view/screens/auth_screens/register_email_verified_sc.dart';
import '../../../view/screens/auth_screens/register_page_sc.dart';
import '../../../view/screens/homepage_sc.dart';
import '../../../view/screens/more_bar_screens/update_user_password_sc.dart';
import '../../../view/screens/search_sc.dart';
import '../constants/app_routes.dart';


Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.wrapperPage: (context) => const WrapperPageSc(),
  AppRoute.onBoarding: (context) => const OnBoardingSc(),
  AppRoute.login: (context) => const LoginSc(),
  AppRoute.register: (context) => const RegisterPageSc(),
  AppRoute.signInEmailVerified: (context) => const RegisterEmailVerifiedSc(),
  AppRoute.resetPassPage: (context) => const ResetPasswordSc(),
  AppRoute.confirmPassPage: (context) => const ConfirmResetPasswordSc(),
  AppRoute.forgotPassPage: (context) => const ForgetPasswordSc(),
  AppRoute.homePage: (context) =>  HomepageSc(),
  AppRoute.searchSc: (context) =>  SearchSc(),
  AppRoute.itemDetailOrderSc: (context) => const OrderItemSc(),
  AppRoute.favorite: (context) => const FavoriteItemSc(),
  AppRoute.cart: (context) => const CartSc(),
  AppRoute.categories: (context) => const CategoriesSc(),
  AppRoute.itemCategory: (context) => const ItemCategorySc(),
  AppRoute.setting: (context) => const SettingSc(),
  AppRoute.language: (context) => const ChangeLanguageSc(),
  AppRoute.comingSoon: (context) => const ComingSoonSc(),
  AppRoute.changePassword: (context) => const UpdateUserPasswordSc(),
};
