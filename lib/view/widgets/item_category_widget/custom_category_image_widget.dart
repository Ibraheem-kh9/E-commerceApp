import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategoryImageWidget extends StatelessWidget {
  final String? imageUrl;

  const CustomCategoryImageWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.h))),
        height: 20.h,
        width: 18.h,

        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          errorWidget: (context, error, dynamic) {
            return Image.asset(
              'assets/images/no_image_available.jpg',
            );
          },
        ),
      ),
    );
  }
}
