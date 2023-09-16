import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomPromoImageWidget extends StatelessWidget {
  final ProductViewModel productViewModel;

  const CustomPromoImageWidget({super.key, required this.productViewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: CarouselSlider.builder(
        itemCount: productViewModel.imagePromoModel.length,
        itemBuilder: (context, imgIndex, _) {
          return Image.asset(
            '${productViewModel.imagePromoModel[imgIndex].imageUrl}',
            fit: BoxFit.fill,
          );
        },
        options: CarouselOptions(
          animateToClosest: true,
          enableInfiniteScroll: true,
          height: 70.h,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
