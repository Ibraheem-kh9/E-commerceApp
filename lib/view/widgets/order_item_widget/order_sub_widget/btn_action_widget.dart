import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BtnActionWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final String? text;

  const BtnActionWidget(
      {super.key,
      this.onPressed,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor!,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.h))),
        ),
        backgroundColor: MaterialStatePropertyAll(backgroundColor!),
      ),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 13.sp,
          color: textColor,
        ),
      ),
    );
  }
}
