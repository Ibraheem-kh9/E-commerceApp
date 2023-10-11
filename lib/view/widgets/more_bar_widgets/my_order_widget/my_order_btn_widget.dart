import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderBtnWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Color btnColor;
  final String btnText;

  const MyOrderBtnWidget(
      {super.key, required this.btnColor, required this.btnText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(btnColor),
        minimumSize: MaterialStatePropertyAll(Size(14.h, 3.5.h)),
        maximumSize: MaterialStatePropertyAll(Size(14.h, 4.h)),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9.5.sp,
        ),
      ),
    );
  }
}
