import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/item_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ImagesOrderWidget extends StatelessWidget {
  final ProductModel product;

  const ImagesOrderWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images!.length,
      itemBuilder: (context, index, _) {
        return SizedBox(
          width: double.infinity,
          child: Image.network(
            product.images![index],
            fit: BoxFit.contain,
            width: double.infinity,
            errorBuilder: (context, Object exception, StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/no_image_available.jpg',
              );
            },
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (value,_){
          context.read<ItemDetailsViewModel>().setImageIndex(value);
        },
        padEnds: false,
        initialPage: 0,
        enableInfiniteScroll: false,
        enlargeFactor: 0,
        height: 44.h,
        autoPlay: false,

        enlargeCenterPage: false,
      ),
    );
  }
}
