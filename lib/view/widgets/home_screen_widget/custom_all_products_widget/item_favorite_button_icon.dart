import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';
import '../../../../models/favorite_model.dart';
import '../../../../view_model/favorite_view_model.dart';
import '../../../../view_model/product_view_model.dart';

class ItemFavoriteButtonIcon extends StatelessWidget {
  /// add final after update
  final int? productId;
 // final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerState;
  final ProductModel? productModel;

  const ItemFavoriteButtonIcon(
      {Key? key, this.productModel,/* this.scaffoldMessengerState,*/ this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteVM = Provider.of<FavoriteViewModel>(context);
    return Consumer<FavoriteViewModel>(
      builder: (context, notify, child) {
       // ProductModel product = productViewModel.productModelView![itemIndex!];
        return Container(
          width: 4.h,
          height: 4.h,

          decoration:  BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.kIconColor),
          ),
          child: GestureDetector(
            //key: Key('icon_$itemIndex'),
            onTap: () {
              if(favoriteVM.favoriteData[productId] == "1"){
                favoriteVM.isFavorite(productId!, "0");
                favoriteVM.deleteProductFromFavorite(productModel!);
                // print(favorite);
              }
              else{
                favoriteVM.isFavorite(productId!, "1");
                favoriteVM.addFavoriteItem(productModel!);
                //  print(favorite);

              }

              //  productViewModel.setFavoriteCheck(itemIndex);
              // FavoriteModel favItem = FavoriteModel(
              //   favoriteItemId: product.id,
              //   favoriteItemName: product.title,
              //   favoriteItemDiscount: product.discountPercentage!.toInt(),
              //  // favoriteQty: product.quantity,
              //  // favoriteTotalPrice: product.totalProductPrice,
              //
              //   /// add toDouble
              //   favoriteItemPrice: product.price!.toDouble(),
              //   favoriteImage: product.images!.first,
              // );
              /* product.isFavorite == true
                      ? favoriteVM.addFavoriteItem(favItem)
                      : favoriteVM.removeFavoriteItem(
                          favItem, favItem.favoriteItemId!);*/
            },
            child: favoriteVM.favoriteData[productId] != "1"
                ? Icon(Icons.favorite_border , color: AppColor.kGreyColor,size: 14.sp)
                : Icon(Icons.favorite , color: AppColor.kIconColor,size: 14.sp),
          ),
        );
      },
    );
  }
}
