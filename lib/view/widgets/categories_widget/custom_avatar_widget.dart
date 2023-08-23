import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAvatarWidget extends StatelessWidget {
  final String? imageName;
  const CustomAvatarWidget({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 4.h,
      child: Image.asset(
        imageName!,
        //scale: 10.0,
      ),
    );
  }
}
