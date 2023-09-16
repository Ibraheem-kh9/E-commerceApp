/*
import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/product_view_model.dart';

class ItemOrderTotalPriceWidget extends StatelessWidget {
  final Product product;
  const ItemOrderTotalPriceWidget({Key? key ,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, userNotify, child) {
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Price : ',
                  style: TextStyle(
                    color: AppColor.kMainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),),
              TextSpan(
                text: '${product.totalProductPrice!}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
*/
