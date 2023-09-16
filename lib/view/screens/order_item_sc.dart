import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_item_rate_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_price_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/order_details_add_sub_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../models/favorite_model.dart';
import '../widgets/order_item_widget/image_order_slider_widget.dart';
import '../widgets/order_item_widget/item_order_addtocart_button_widget.dart';
import '../widgets/order_item_widget/item_text_widget.dart';
import '../widgets/order_item_widget/order_image_list_widget.dart';

class OrderItemSc extends StatelessWidget {
  final ProductModel? product;
  final FavoriteModel? favoriteModel;
  final ProductViewModel? productViewModel;

  const OrderItemSc(
      {Key? key, this.product, this.productViewModel, this.favoriteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final orderViewModel = context.read<ItemDetailsViewModel>();
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Images Slider----------------------------------------------
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0.0,
                    bottom: 0,
                    child: ImagesOrderWidget(product: product!),
                  ),
                  Positioned(
                    top: 0.0.h,
                    left: 1.w,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.amber,
                        size: 3.5.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            OrderImageListWidget(imageLength: product!.images!.length),

            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemTextWidget(
                      textName: product!.brand!,
                      fontSize: 13.sp,
                      color: AppColor.kBlueColor,
                    ),
                    ItemTextWidget(
                      textName: product!.title!,
                      fontSize: 15.sp,
                      color: AppColor.kDefaultTextColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    OrderItemRateWidget(
                      rate: product!.rating!,
                      rateFixing: product!.rating!.toStringAsFixed(1),
                    ),
                    ItemTextWidget(
                      textName: product!.description.toString(),
                      fontSize: 10.sp,
                      color: AppColor.kDescriptionTextColor,
                    ),
                    ItemTextWidget(
                      textName:
                          '${productViewModel!.calcPriceWithPercentage(product!.price!.toDouble(), product!.discountPercentage!.floorToDouble())} \$',
                      fontSize: 17.sp,
                      color: AppColor.kDefaultTextColor,
                    ),
                    OrderPriceWidget(
                      price: product!.price!,
                      discountPrice: product!.discountPercentage!.toInt(),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<CartViewModel>(
              builder: (context, cartNotify, child) =>
                  !cartNotify.checkProductStatus(product!.id!)
                      ? OrderAddToCartWidget(
                          product: product!,
                          productId: product!.id!,
                        )
                      : Expanded(child: OrderDetailsAddSubWidget()),
            ),
            //// Increase or Decrease Qty of item in order----------------------
            /*Positioned.fill(
              top: 58.h,
              bottom: 1.h,
              child: ItemOrderQtyWidget(product: product!),
            ),*/
            // Divider(
            //   color: AppColor.kMainColor,
            //   endIndent: 18.w,
            //   indent: 20.w,
            //   thickness: 2,
            // ),
            /*Positioned.fill(
              bottom: 3.h,
              child: Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //// Total Price for each item in order---------------------
                    ItemOrderTotalPriceWidget(
                      product: product!,
                    ),
                    //// Add Item To Cart Widget--------------------------------
                    ItemOrderAddToCartWidget(product: product!),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
