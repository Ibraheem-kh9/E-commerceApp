import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/app_icons.dart';

class PromoRateNoSection extends StatelessWidget {
  final String rate;
  const PromoRateNoSection({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              rate,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            alignment: PlaceholderAlignment.middle,
          ),
          WidgetSpan(
            child: Image.asset(
              AppIcons.starIcon,
              scale: 18.sp,
            ),
            alignment: PlaceholderAlignment.middle,
          )
        ],
      ),
    );
  }
}
