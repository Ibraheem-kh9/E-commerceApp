
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants/constant_color.dart';

ThemeData englishTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Times',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 15.sp,
        fontFamily: 'Times',
        fontWeight: FontWeight.bold,
        color: AppColor.kMainColor ,
      ),
      bodyLarge: TextStyle(
        height: 1.5,
        fontStyle: FontStyle.normal,
        fontSize: 12.sp,
        fontFamily: 'Times',
        fontWeight: FontWeight.bold,
        color: const Color.fromRGBO(220, 227, 241, 1),
      ),
    ),
);

ThemeData arabicTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Arabic',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 15.sp,
        fontFamily: 'Arabic',
        fontWeight: FontWeight.bold,
        color: AppColor.kMainColor ,
      ),
      bodyLarge: TextStyle(
        height: 1.5,
        fontStyle: FontStyle.normal,
        fontSize: 12.sp,
        fontFamily: 'Arabic',
        fontWeight: FontWeight.bold,
        color: const Color.fromRGBO(220, 227, 241, 1),
      ),
    ),
);