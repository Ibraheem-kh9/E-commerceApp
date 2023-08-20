

import 'package:e_commerce_app/models/favorite_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/db_helper.dart';
import '../models/cart_model.dart';

class CartViewModel with ChangeNotifier {
  DbHelper dbHelper = DbHelper();
  List<CartModel> _items = [];
  Future<List<CartModel>>? _productCart ;
  int _counter = 0;
  bool _isAdded = false;
  int _qty = 0;
  double _totalPrice = 0.0;
  double _cartPrice = 0;
  int shipping = 3;
  bool _isSelected = false;

  int get counter => _counter;

  List<CartModel> get items => _items;

  Future<List<CartModel>> get productCart => _productCart!;

  bool get isAdded => _isAdded;

  int get itemQuantity => _qty;

  double get totalPrice => _totalPrice;

  double get cartPrice => _cartPrice;
  bool? get isSelected => _isSelected;

  // int get shipping => _shipping;

  CartViewModel() {
    getCartData();
  }

  Future<List<CartModel>> getCartData() async {
      _productCart = dbHelper.getDbData();
      //notifyListeners();
      print(_productCart);
      return _productCart!;

  }

  addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  getCounter() {
    _getPrefItems();
    //notifyListeners();
    return _counter;
  }

  cartTotalPriceIncrease({int? qty, double? itemPrice}) {
    _cartPrice = qty! * itemPrice!;
    _setPrefItems();
    notifyListeners();
    return _cartPrice;
  }

  cartTotalPriceDecrease({int? qty, int? itemPrice}) {
    _cartPrice = qty! * itemPrice! - 1;
    _setPrefItems();
    notifyListeners();
    return _cartPrice;
  }

  getCartTotalPrice() {
    _getPrefItems();
    return _cartPrice;
  }

  setIsAddedStatus(bool status, int index) {
    _isAdded == status && FavoriteModel().favoriteItemId == index;
    print(status);
    notifyListeners();
  }

  setItemZero() {
    _qty = 0;
    notifyListeners();
  }

  setTotalPriceToZero() {
    _totalPrice = 0.0;
  }

  itemQtyDecrease() {
    _qty--;
    notifyListeners();
  }

  // itemTotalPriceIncrease(dynamic price) {
  //   _totalPrice = itemQuantity * price;
  //   notifyListeners();
  //   return _totalPrice;
  // }

  // itemTotalPriceDecrease(dynamic price) {
  //   _totalPrice = itemQuantity * price -1;
  //   notifyListeners();
  //   return _totalPrice;
  // }

  addItem(CartModel cartModel) {
    _items.add(cartModel);
    notifyListeners();
  }

  void removeItem(int id) {
    final index =
        _items.indexWhere((CartModel cartModel) => cartModel.itemId == id);
    _items.removeAt(index);

    notifyListeners();
  }

  dynamic cartSubTotalPrice(double price){
    _cartPrice = _cartPrice + price;
    return _cartPrice;
  }

  dynamic cartSubTotalPriceRemove(double price){
    _cartPrice = (_cartPrice - price);
    return _cartPrice;
  }



  // int get cartSubPrice => _items.fold(
  //       0,
  //       (dynamic previousValue, CartModel cartModel) =>
  //           previousValue + cartModel.itemTotalPrices,
  //     );

  // dynamic get cartTotalPrices {
  //   var total = cartSubPrice + shipping;
  //   return total;
  // }

  // Future<void> saveCart() async {
  //   final prefs = await _prefs;
  //   final cartJson = _items.map((item) => item.toJson()).toList();
  //   await prefs.setString('cart', json.encode(cartJson));
  // }

  void _setPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cart_count', counter);
    pref.setDouble('cart_price', cartPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('cart_count') ?? 0;
    _cartPrice = pref.getDouble('cart_price') ?? 0.0;
    notifyListeners();
  }

  /// Is add item to cart highlight

  setCartSelectedItems({bool? selectStatus,int? id}){
    _isSelected = selectStatus!;
    _setPrefItemToCart();
    notifyListeners();
  }
  void _setPrefItemToCart() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('selected', _isSelected);
    notifyListeners();
  }
  void _getPrefItemToCart()async {
    SharedPreferences _pref =await SharedPreferences.getInstance();
    _pref.getBool('selected') ?? false;
    notifyListeners();
  }

  getSelectedItem() {
    _getPrefItemToCart();
    //notifyListeners();
    return _isSelected;
  }
}
