import 'package:e_commerce_app/core/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/cart_sub_widget/cart_image_section.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/cart_sub_widget/cart_item_btn_section.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/cart_sub_widget/cart_text_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../view_model/cart_view_model.dart';

class CustomCartItemsWidget extends StatelessWidget {
  const CustomCartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return SizedBox(
      height: 65.h,
      child: Consumer<CartViewModel>(builder: (context,notify,child){
        return ListView.builder(
          itemCount: cartViewModel.addItemToCart.length,
          itemBuilder: (context, index) {
            return Container(
              height: 99.0,
              margin: EdgeInsets.only(
                left: 2.h,
                right: 2.h,
                top: 0.5.h,
                bottom: 0.5.h
              ),
              padding: EdgeInsets.only(
                left: 0.5.h,
                right: 0.5.h,
                top: 0.5.h,
                bottom: 0.5.h,
              ),
              color: AppColor.kBackgroundContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartImageSection(
                    image: cartViewModel.addItemToCart[index].itemImage!,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CartTextWidget(
                          text: cartViewModel.addItemToCart[index].itemName!,
                          fontSize: 14.sp,
                          fontColor: AppColor.kDefaultTextColor,
                        ),
                        CartTextWidget(
                          text: 'Price: ${cartViewModel.addItemToCart[index].itemPrice} \$',
                          fontSize: 11.sp,
                          fontColor: AppColor.kIconColor,
                        ),
                        CartTextWidget(
                          text: 'Qty: ${cartViewModel.addItemToCart[index].itemQty!}',
                          fontSize: 12.sp,
                          fontColor: AppColor.kDefaultTextColor,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartTextWidget(
                        text:
                        '${cartViewModel.addItemToCart[index].itemTotalPrices} \$',
                        //'${snap.data![index].itemTotalPrices!.floorToDouble()} \$',
                        //snap.data![index].itemName!,
                        fontSize: 16.sp,
                        fontColor: AppColor.kDefaultTextColor,
                      ),
                      Row(
                        children: [
                          CartItemBtnSection(
                            onPress: () async{
                               await cartViewModel.removeItemFromCart(
                                itemId: notify.addItemToCart[index].itemId!,
                              );
                              notify.decreaseCounter();
                            },
                            iconData: Icons.delete,
                            iconColor: Colors.red,
                          ),
                          CartItemBtnSection(
                            onPress: () {},
                            iconData: Icons.edit,
                            iconColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      })
    );
  }
}
