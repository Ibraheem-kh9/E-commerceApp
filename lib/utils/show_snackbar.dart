
import 'package:e_commerce_app/utils/constants/constant_color.dart';
import 'package:flutter/material.dart';

class ShowSnackBar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

   static shSnackBar(String? text) {
    if (text == null) return;

    final snackBarMessage = SnackBar(
      content: Text(text), backgroundColor: AppColor.cancelColor,);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBarMessage);
  }
}