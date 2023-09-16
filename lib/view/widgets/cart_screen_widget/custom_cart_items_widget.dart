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
                          text: cartViewModel.addItemToCart[index].itemPrice
                              .toString(),
                          fontSize: 11.sp,
                          fontColor: AppColor.kIconColor,
                        ),
                        CartTextWidget(
                          text: cartViewModel.addItemToCart[index].itemQty!
                              .toString(),
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
                              var response = await cartViewModel.removeItemFromCart(
                                itemId: notify.addItemToCart[index].itemId!,
                              );
                              notify.decreaseCounter();
                              return response;
                              // print(
                              //     'the Id is ${cartViewModel.addItemToCart[index].id!} + '
                              //         'the item ID is ${cartViewModel.addItemToCart[index].id!}');
                              //cartNotify.removeItem(snap.data![index].itemId!);
                              // dbHelper.deleteItemFromCart(
                              //     snap.data![index].id!);
                              // cartNotify.removeCounter();
                              // cartNotify.cartSubTotalPriceRemove(
                              //     snap.data![index].itemTotalPrices!);
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

/*

import 'package:e_commerce_app/core/utils/constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/services/db_helper.dart';
import '../../../models/cart_model.dart';
import '../../../view_model/cart_view_model.dart';

class CustomCartItemsWidget extends StatelessWidget {
  const CustomCartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = DbHelper();
    return SizedBox(
      height: 50.h,
      child: FutureBuilder(
          future: context.read<CartViewModel>().getCartData(),
          builder: (context,AsyncSnapshot<List<CartModel>?> snap){
            if(snap.hasData){
              return ListView.builder(
                //shrinkWrap: true,
                itemCount: 2,
                //itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 99.0,
                    margin: EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0, top: 10.0),
                    color: AppColor.kBackgroundContainer,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          height: 75.0,
                          width: 75.0,
                          child: Image.network(
                            //snap.data![index].itemImage!,
                            'snap.data![index].itemImage!',
                            width: 140,
                            height: 99.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'item Name',
                                //snap.data![index].itemName!,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '112 \$',
                                //'${snap.data![index].itemTotalPrices!.floorToDouble()} \$',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '5',
                                //snap.data![index].itemQty!.toString(),
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        Consumer<CartViewModel>(builder: (context, cartNotify,child){
                          return Expanded(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    //cartNotify.removeItem(snap.data![index].itemId!);
                                    dbHelper.deleteItemFromCart(snap.data![index].id!);
                                    cartNotify.removeCounter();
                                    cartNotify.cartSubTotalPriceRemove(snap.data![index].itemTotalPrices!);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          );
                        },)
                      ],
                    ),
                  );
                },
              );
            }
            else{
              return Text('No Data Found');
            }
          }),
    );
  }
}
*/
