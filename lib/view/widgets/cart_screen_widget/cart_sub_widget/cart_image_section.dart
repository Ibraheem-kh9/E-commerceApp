import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartImageSection extends StatelessWidget {
  final String image;
  const CartImageSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 1.h,
        left: 1.h,
        right: 1.h,
        bottom: 1.h,
      ),
      height: 11.h,
      width: 12.h,
      child: CachedNetworkImage(
        imageUrl: image,
        //snap.data![index].itemImage!,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
