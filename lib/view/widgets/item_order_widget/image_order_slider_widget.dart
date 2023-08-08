import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImagesOrderWidget extends StatelessWidget {
  final Product product;

  const ImagesOrderWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: CarouselSlider.builder(
        itemCount: product.images!.length,
        itemBuilder: (context, index, _) {
          return Image.network(
            product.images![index],
            fit: BoxFit.cover,
            errorBuilder: (context, Object exception, StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/no_image_available.jpg',
              );
            },
          );
        },
        options: CarouselOptions(
          initialPage: 1,
          enableInfiniteScroll: false,
          enlargeFactor: 0.2,
          height: 44.h,
          autoPlay: false,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
