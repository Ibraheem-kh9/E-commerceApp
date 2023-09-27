import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/btn_action_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/btn_inc_dec_sub_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/qty_change_section.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/total_price_section.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/order_item_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/constants/constant_color.dart';
import '../../../../models/cart_model.dart';

class OrderDetailsAddSubWidget extends StatelessWidget {
  final ProductViewModel productViewModel;
  final ProductModel? productModel;
  final int id;
  final int index;

  const OrderDetailsAddSubWidget(
      {super.key,
      required this.id,
      required this.productViewModel,
      this.productModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final orderItemViewModel =
        Provider.of<OrderItemViewModel>(context, listen: true);
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(1.h),
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColor.kBackgroundContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.h),
            topRight: Radius.circular(5.h),
          )),
      child: FutureBuilder(
        future: orderItemViewModel.showData(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              children: [
                Consumer<OrderItemViewModel>(builder: (context, notify, child) {
                  print('the id is $id and index is $index');
                  return TotalPriceSection(
                    price: orderItemViewModel.orderItemTotalPrice(
                      id: id,
                      index: index,
                    ),
                  );
                }),
                QtyChangeSection(
                  increaseWidget: BtnIncDecWidget(
                    onTap: () {
                      orderItemViewModel.decrementProductQty(
                        /*productViewModel,*/
                          index: index,
                          id: id,
                          price: productModel!.price!);
                    },
                    icon: Icons.remove,
                  ),
                  qty: orderItemViewModel.getItemQty(id: id),
                  decreaseWidget: BtnIncDecWidget(
                    onTap: () {
                      orderItemViewModel.incrementProductQty(
                          index: index,
                          id: id,
                          price: productModel!.price!);
                    },
                    icon: Icons.add,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnActionWidget(
                      onPressed: () async {
                        CartModel cartModel = CartModel(
                          id: productModel?.id,
                          itemId: productModel?.id,
                          itemName: productModel?.title,
                          itemImage: productModel?.thumbnail,
                          itemPrice: productModel?.price!.toDouble(),
                          itemQty: context.read<OrderItemViewModel>().qty,
                          itemTotalPrices:
                          context.read<OrderItemViewModel>().itemPrice.toDouble(),
                        );

                        await cartViewModel.insertItemToCart(cartModel);
                        cartViewModel.increaseCounter();
                      },
                      text: 'Save',
                      backgroundColor: AppColor.kBackgroundColor,
                      borderColor: AppColor.kMainColor,
                      textColor: AppColor.kMainColor,
                    ),
                    BtnActionWidget(
                      onPressed: () {},
                      text: 'Order now',
                      backgroundColor: AppColor.kMainColor,
                      borderColor: AppColor.kMainColor,
                      textColor: AppColor.kBackgroundColor,
                    ),
                  ],
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },

      ),
    );
  }
}
