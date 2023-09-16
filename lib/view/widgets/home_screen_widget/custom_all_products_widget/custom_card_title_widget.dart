import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class CardTitleSection extends StatelessWidget {
  final String? title;
  const CardTitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title!,
      softWrap: true,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,

      ),
    );
  }
}
