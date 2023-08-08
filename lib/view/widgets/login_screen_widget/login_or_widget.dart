import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../components/app_local.dart';

class LoginOrDividerWidget extends StatelessWidget {
  const LoginOrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.7,
            endIndent: 8.w,
            indent: 8.w,
            color: Colors.grey,
          ),
        ),
        Text(
          AppLocale.of(context).getTranslated('login_or')!,
          style: TextStyle(fontSize: 12.sp),
        ),
        Expanded(
          child: Divider(
            indent: 8.w,
            endIndent: 8.w,
            thickness: 0.7,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
