import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/constants/constant_color.dart';
import '../../../../view_model/favorite_view_model.dart';
import '../../../../view_model/product_view_model.dart';

class FavDeleteItemButtonIcon extends StatelessWidget {
  /// add final after update
  final int index;
 // final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerState;
  //final ProductModel? favoriteProduct;

  const FavDeleteItemButtonIcon(
      {Key? key, required this.index,/* this.scaffoldMessengerState,*/ })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(builder: (context,notify,child){
      return Container(
        width: 4.h,
        height: 4.h,

        decoration:  BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.cancelColor),
        ),
        child: GestureDetector(
          //key: Key('icon_$itemIndex'),
          onTap: () {

            notify.deleteProductFromFavoriteScreen(index);

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
          child: Icon(Icons.delete , color: AppColor.cancelColor,size: 14.sp),
        ),
      );
    });
  }
}
