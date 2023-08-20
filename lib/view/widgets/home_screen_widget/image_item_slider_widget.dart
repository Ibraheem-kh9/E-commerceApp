import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class ImageItemSliderWidget extends StatelessWidget {
  final Product product;

  const ImageItemSliderWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 1.h,
      ),
      height: 24.h,
      child: CarouselSlider.builder(
        itemCount: product.images!.length > 3 ? 3 : product.images!.length,
        itemBuilder: (ctx, idx, _) => CachedNetworkImage(
          imageUrl: product.images![idx],
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              color: AppColor.kMainColor,
              strokeWidth: 2.0,
            ),
          ),
          fit: BoxFit.cover,
          errorWidget: (context, error, dynamic) {
            return Image.asset(
              'assets/images/no_image_available.jpg',
            );
          },
        )

        /*Image.network(
          product.images![idx],
          //filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          errorBuilder: (context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              'assets/images/no_image_available.jpg',
            );
          },
        )*/
        ,
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: 70.h,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
