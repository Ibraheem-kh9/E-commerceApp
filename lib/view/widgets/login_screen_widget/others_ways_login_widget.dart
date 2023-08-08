
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OthersWaysLoginWidget extends StatelessWidget {
  final VoidCallback onClickButton;
  final String imageSource;

  const OthersWaysLoginWidget({Key? key,required this.onClickButton , required this.imageSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(maxHeight: 20.0,maxWidth: 5.0),
      width: 7.h,
      height: 7.h,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(5.h))
      ),
      child: GestureDetector(
        onTap: onClickButton,
        child: Image.asset(
          imageSource,
          scale: 0.3.h,
        ),
      ),
    );
  }
}
