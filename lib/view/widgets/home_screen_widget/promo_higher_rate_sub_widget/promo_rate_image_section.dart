import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class PromoRateImageSection extends StatelessWidget {
  final String imageUrl;
  const PromoRateImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder:
          (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: AppColor.kMainColor,
          strokeWidth: 2.0,
        ),
      ),
      width: 20.h,
      height: 17.h,
      fit: BoxFit.fill,
      errorWidget: (context, error, dynamic) {
        return Image.asset(
          'assets/images/no_image_available.jpg',
        );
      },
    );
  }
}
