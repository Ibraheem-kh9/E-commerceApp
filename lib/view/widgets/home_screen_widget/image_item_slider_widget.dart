import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        itemBuilder: (ctx, idx, _) => Image.network(
          product.images![idx],
          //filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          errorBuilder: (context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              'assets/images/no_image_available.jpg',
            );
          },
        ),
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
