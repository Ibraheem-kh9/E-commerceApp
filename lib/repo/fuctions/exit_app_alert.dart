import 'dart:io';
import 'package:e_commerce_app/components/app_local.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/constant_color.dart';

Future<bool> exitAppAlert(BuildContext context) {
  AppLocale languageTran = AppLocale.of(context);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.h))),
        title: Text(
          languageTran.getTranslated('alert_title') ?? '',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          languageTran.getTranslated('alert_content') ?? '',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              languageTran.getTranslated('alert_cancel') ?? '',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColor.kMainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text(
              languageTran.getTranslated('alert_confirm') ?? '',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColor.kMainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
  return Future.value(true);
}
