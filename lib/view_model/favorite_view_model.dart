import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/favorite_model.dart';
import '../models/products_model.dart';

class FavoriteViewModel with ChangeNotifier {
  final AuthService authService = AuthService();
  var uuid = Uuid();

  User? _currentUser;
  Map favoriteData = {};
  List<ProductModel> _favoriteDataList = [];

  final Set<Map<String, dynamic>> _favList = {};

  Set<Map<String, dynamic>> get favList => _favList;

  List<ProductModel>? get favoriteDataList => _favoriteDataList;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Connect with firestore ----------------------------------------------------
  addFavoriteItem(ProductModel productModel) async {
    try {
      User _currentUser = authService.firebaseAuth.currentUser!;

      await authService.firestore
          .collection('Favorite_Product')
          .doc(_currentUser.email!)
          .collection('favorite')
          .doc(productModel.id.toString())
          .set({
        'id': productModel.id,
        'title': productModel.title,
        'price': productModel.price,
        'brand': productModel.brand,
        'description': productModel.description,
        'discountPercentage': productModel.discountPercentage,
        'favItemCreate': DateTime.now(),
        'thumbnail': productModel.thumbnail,
        'favorite': productModel.favorite,
      }).then((value) => print('Added Item Successfully '));
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteProductFromFavorite(ProductModel productModel) async {
    User _currentUser = authService.firebaseAuth.currentUser!;

    await authService.firestore
        .collection('Favorite_Product')
        .doc(_currentUser.email)
        .collection('favorite')
        .doc(productModel.id.toString())
        .delete()
        .then((value) => print('Item delete successfully'));
  }

  Future deleteProductFromFavoriteScreen(int index) async {
    User _currentUser = authService.firebaseAuth.currentUser!;

    await authService.firestore
        .collection('Favorite_Product')
        .doc(_currentUser.email)
        .collection('favorite')
        .doc(index.toString())
        .delete()
        .then((value) => print('Item delete successfully'));
  }

  Stream<Object>? streamData(int id) {
    return authService.firestore
        .collection('Favorite_Product')
        .doc(_currentUser!.email)
        .collection('favorite')
        .where("id", isEqualTo: id)
        .snapshots();
  }

  Stream<QuerySnapshot> getFavoriteItem() {
    User _currentUser = authService.firebaseAuth.currentUser!;
    var collection = authService.firestore
        .collection('Favorite_Product')
        .doc(_currentUser.email)
        .collection('favorite').snapshots();


    //_favoriteDataList = list;
    // _favoriteDataList = data.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    print('the favorite data are ==================$_favoriteDataList');
    return collection;
  }

  isFavorite(id, value) {
    favoriteData[id] = value;
    notifyListeners();
  }

  // save favorite items to shared Storage -------------------------------------
  /*
 void _setPrefFavoriteItem() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final value = _favList.map((favorite) => favorite.toJson()).toList();
    await _pref.setString('favItem', jsonEncode(value));
    print('the shared prefenece of set is ${value}');
  }
  */

  // setItemFavorite(bool status){
  //   status = !_isFavoriteItem;
  //   _setPrefFavoriteItem();
  //   notifyListeners();
  // }
  /*scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        width: 200.0,
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.down,
        content: Text('Item added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );*/

  /*void _getPrefFavoriteItem() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final value = _pref.getString('favItem');
    if (value != null) {
      final data = jsonDecode(value);
      _favList = List<FavoriteModel>.from(
          data.map((favorite) => FavoriteModel.fromJson(favorite)));
      notifyListeners();
    }
  }*/
/*
  List<FavoriteModel> get getItemsOfFavoriteList {
    _getPrefFavoriteItem();
    return _favList;
  }*/

  removeFavoriteItem(FavoriteModel favoriteModel, int index) async {
    // favList.removeWhere((FavoriteModel favoriteModel) =>
    //     favoriteModel.isFavorite == false &&
    //     favoriteModel.favoriteItemId == index);
    // _setPrefFavoriteItem();
    // print('Delete from Favorite List');
    // notifyListeners();
  }

//// increase qty of favorite item ---------------------------------------------
  incrementProductQty(int id) {
    /*  final index = favList.indexWhere((FavoriteModel? favoriteModel) => favoriteModel!.favoriteItemId == id);
    if (index >= 0) {
      favList[index].favoriteQty++ ;
      notifyListeners();
    }
    print(productModelView?.products![index].quantity);*/
  }

  decrementProductQty(int id) {
    /* final index = productModelView?.products!.indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
      productModelView?.products![index].quantity--;
      notifyListeners();
    }
    print(productModelView?.products![index].quantity);*/
  }
}
