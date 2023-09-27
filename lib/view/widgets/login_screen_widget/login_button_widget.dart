import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String textButton;
  final Color buttonColor;
  final MaterialStateProperty<Size>? fixedSize;

  const LoginButtonWidget({
    Key? key,
    required this.onPress,
    required this.textButton,
    required this.buttonColor,
    required this.fixedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 5.5.h,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            5.w,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          fixedSize: fixedSize,
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.w),
              ),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          elevation: const MaterialStatePropertyAll(0.0),
        ),
        child: Text(
          textButton,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
