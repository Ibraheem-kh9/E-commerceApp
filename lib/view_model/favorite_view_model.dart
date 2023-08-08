import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/favorite_model.dart';
import '../models/products_model.dart';

class FavoriteViewModel with ChangeNotifier{
  ProductModel? _productModelView;
  late List<FavoriteModel> _favList = [] ;

  ProductModel? get productModelView => _productModelView;
  List<FavoriteModel> get favList => _favList;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  // setItemFavorite(bool status){
  //   status = !_isFavoriteItem;
  //   _setPrefFavoriteItem();
  //   notifyListeners();
  // }


  //// select Item as Favorite and add to List------------------------------------
  /// TODO: Create Db instead of list and add Favorite items to it -------------
  addFavoriteItem(FavoriteModel favoriteModel) async{
    //if(_productModelView!.products![index1].isFavorite == true){
    //favList.firstWhere((FavoriteModel favoriteModel) => favoriteModel == productModelView ,orElse: () => favoriteModel );
    _favList.add(favoriteModel);
    _setPrefFavoriteItem();
    notifyListeners();
    /*scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        width: 200.0,
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.down,
        content: Text('Item added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );*/
    print('the shared prefenece of add is ${_setPrefFavoriteItem}');

  }
  // save favorite items to shared Storage -------------------------------------
  void _setPrefFavoriteItem() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final value = _favList.map((favorite) => favorite.toJson()).toList();
    await _pref.setString('favItem', jsonEncode(value));
    print('the shared prefenece of set is ${value}');
  }

  void _getPrefFavoriteItem() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final value = _pref.getString('favItem');
    if(value != null){
      final data = jsonDecode(value);
      _favList = List<FavoriteModel>.from(
        data.map((favorite) => FavoriteModel.fromJson(favorite))
      );
      notifyListeners();
    }
  }

  List<FavoriteModel> get getItemsOfFavoriteList{
    _getPrefFavoriteItem();
    return _favList;
  }

  removeFavoriteItem(FavoriteModel favoriteModel, int index) async {
    favList.removeWhere((FavoriteModel favoriteModel) =>
    favoriteModel.isFavorite == false &&
        favoriteModel.favoriteItemId == index);
    _setPrefFavoriteItem();
    print('Delete from Favorite List');
    notifyListeners();
  }
//// increase qty of favorite item ---------------------------------------------
  incrementProductQty(int id) {
    final index = favList.indexWhere((FavoriteModel? favoriteModel) => favoriteModel!.favoriteItemId == id);
    if (index >= 0) {
      favList[index].favoriteQty++ ;
      notifyListeners();
    }
    print(productModelView?.products![index].quantity);
  }

  decrementProductQty(int id) {
    final index = productModelView?.products!.indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
      productModelView?.products![index].quantity--;
      notifyListeners();
    }
    print(productModelView?.products![index].quantity);
  }


}