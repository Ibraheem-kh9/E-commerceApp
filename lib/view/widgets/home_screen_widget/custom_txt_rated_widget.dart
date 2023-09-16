import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/app_icons.dart';

class CustomTxtRatedWidget extends StatelessWidget {
  final String text;
  const CustomTxtRatedWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.5.h),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            WidgetSpan(
              child: Image.asset(
                AppIcons.starIcon,
                scale: 14.sp,
              ),
              alignment: PlaceholderAlignment.middle,
            )
          ],
        ),
      ),
    );
  }
}
