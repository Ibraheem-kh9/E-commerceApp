import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class ItemImageSliderSection extends StatelessWidget {
  final String? imageUrl;

  const ItemImageSliderSection({Key? key, required this.imageUrl})
      : super(key: key);

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
