import 'package:e_commerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/favorite_model.dart';
import '../../../utils/constants/constant_color.dart';
import '../../../view_model/favorite_view_model.dart';
import '../../../view_model/product_view_model.dart';

class FavoriteButtonWidget extends StatelessWidget {
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerState;
  final int itemIndex;

  FavoriteButtonWidget(
      {Key? key, required this.itemIndex, this.scaffoldMessengerState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);
    final favoriteVM = Provider.of<FavoriteViewModel>(context);
    return Consumer<FavoriteViewModel>(
      builder: (context, notify, child) {
        Product product =
            productViewModel.productModelView!.products![itemIndex];
        return GestureDetector(
          key: Key('icon_$itemIndex'),
          onTap: () {
            productViewModel.setFavoriteCheck(itemIndex);
            FavoriteModel favItem = FavoriteModel(
              favoriteItemId: product.id,
              favoriteItemName: product.title,
              favoriteItemDiscount: product.discountPercentage!.toInt(),
              favoriteQty: product.quantity,
              favoriteTotalPrice: product.totalProductPrice,

              /// add toDouble
              favoriteItemPrice: product.price!.toDouble(),
              favoriteImage: product.images!.first,
            );
            product.isFavorite == true
                ? favoriteVM.addFavoriteItem(favItem)
                : favoriteVM.removeFavoriteItem(
                    favItem, favItem.favoriteItemId!);
          },
          child: product.isFavorite == true
              ? const Icon(
                  Icons.favorite,
                  color: AppColor.kMainColor,
                )
              : const Icon(Icons.favorite_border),
        );
      },
    );
  }
}
