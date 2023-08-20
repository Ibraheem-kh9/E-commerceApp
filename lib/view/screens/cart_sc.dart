import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/db_helper.dart';
import '../../core/utils/constants/constant_color.dart';

class CartSc extends StatelessWidget {
  const CartSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocale localeLang = AppLocale.of(context);
    DbHelper dbHelper = DbHelper();
    var cartViewModel = context.watch<CartViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        appBar: AppBar(
            backgroundColor: AppColor.kMainColor,
            // actions: [
            flexibleSpace: Align(
                alignment: Alignment.center,
                child: Text(
                  localeLang.getTranslated('cart_title')!,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            //],
            ),
        body: Consumer<CartViewModel>(
          builder: (context, cart, child) {
            return Stack(
              children: [
                Positioned.fill(
                  top: 0.0,
                  bottom: 200.0,
                  left: 0.0,
                  right: 0.0,
                  child: FutureBuilder(
                      future: cart.getCartData(),
                      builder: (context,AsyncSnapshot<List<CartModel>> snap){
                    if(snap.hasData){
                      return ListView.builder(
                        //shrinkWrap: true,
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            height: 99.0,
                            margin: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0, top: 10.0),
                            color: Color(0xFF5A6EA9).withOpacity(0.05),
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
                                    snap.data![index].itemImage!,
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
                                        snap.data![index].itemName!,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snap.data![index].itemTotalPrices!.floorToDouble()} \$',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snap.data![index].itemQty!.toString(),
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
                ),
                cartViewModel.counter > 0 ?Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Sub-Total : ',
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${cart.getCartTotalPrice()}',
                                //'${cart.cartSubPrice}',
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping : ',
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  cart.shipping.toString(),
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColor.kMainColor,
                            endIndent: 15.0,
                            indent: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price : ',
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '',
                                //'${cart.cartTotalPrices}',
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColor.kMainColor),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)))),
                                minimumSize: MaterialStatePropertyAll(Size(150.0,45.0)),
                                maximumSize: MaterialStatePropertyAll(Size(150.0,45.0)),
                              ),
                              child: Text('Pay',style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.bold),),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}

