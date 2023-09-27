import 'package:e_commerce_app/models/favorite_model.dart';
import 'package:e_commerce_app/models/products_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/db_helper.dart';
import '../models/cart_model.dart';

class CartViewModel extends ChangeNotifier {
  final DbHelper _dbHelper = DbHelper();

  DbHelper get dbHelper => _dbHelper;
  final List<CartModel> _items = [];
  int _counter = 0;
  bool _isAdded = false;
  int _qty = 0;
  double _totalPrice = 0.0;
  double _cartLineTotal = 0;
  int shipping = 3;
  bool _isSelected = false;

  int get counter => _counter;

  List<CartModel> get items => _items;

  bool get isAdded => _isAdded;

  int get itemQuantity => _qty;

  double get totalPrice => _totalPrice;

  double get cartLineTotal => _cartLineTotal;

  bool? get isSelected => _isSelected;

  /// --------------------------------------------------------------------------
  CartViewModel() {
    readCartData();
  }

  ///////////////////
  List<CartModel> _addItemToCart = [];

  List<CartModel> get addItemToCart => _addItemToCart;

  insertItemToCart(CartModel cartModel) async {
    _addItemToCart.add(cartModel);
    int response = await _dbHelper.insertDb(cartModel);
    notifyListeners();
    return response;
  }

  Future<List<CartModel>?> readCartData() async {
    List<CartModel>? data = await _dbHelper.getDbData();
    _addItemToCart.addAll(data!);
    //return data;
  }

  removeItemFromCart({int? itemId}) async {
    int response = await _dbHelper.deleteItemFromCart(itemId!);
    _addItemToCart.removeWhere((element) => element.itemId == itemId);
    notifyListeners();
    return response;
  }

  /// counter of cart icon that display how many item added --------------------
  increaseCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  decreaseCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  getCounter() {
    _getPrefItems();
    return _counter;
  }

  double get cartSubPrice => _addItemToCart.fold(
        0,
        (dynamic previousValue, CartModel cartModel) =>
            previousValue + cartModel.itemTotalPrices,
      );

  double get cartTotalPrices {
    var total = cartSubPrice + shipping;
    return total;
  }

  /// --------------------------------------------------------------------------
  ///
  ///
  ///

  cartTotalPriceIncrease({int? qty, double? itemTotalPrice}) {
    _cartLineTotal = qty! * itemTotalPrice!;
    _setPrefItems();
    notifyListeners();
    return _cartLineTotal;
  }

  cartTotalPriceDecrease({int? qty, int? itemPrice}) {
    _cartLineTotal = qty! * itemPrice! - 1;
    _setPrefItems();
    notifyListeners();
    return _cartLineTotal;
  }

  getCartTotalPrice() {
    _getPrefItems();
    return _cartLineTotal;
  }

  setIsAddedStatus(bool status, int index) {
    _isAdded == status && FavoriteModel().id == index;
    print(status);
    notifyListeners();
  }




  dynamic cartSubTotalPrice(double price) {
    _cartLineTotal = _cartLineTotal + price;
    return _cartLineTotal;
  }

  dynamic cartSubTotalPriceRemove(double price) {
    _cartLineTotal = (_cartLineTotal - price);
    return _cartLineTotal;
  }





  // Future<void> saveCart() async {
  //   final prefs = await _prefs;
  //   final cartJson = _items.map((item) => item.toJson()).toList();
  //   await prefs.setString('cart', json.encode(cartJson));
  // }

  void _setPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cart_count', counter);
    pref.setDouble('cart_price', cartLineTotal);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('cart_count') ?? 0;
    _cartLineTotal = pref.getDouble('cart_price') ?? 0.0;
    notifyListeners();
  }

  /// Is add item to cart highlight

  setCartSelectedItems({bool? selectStatus, int? id}) {
    _isSelected = selectStatus!;
    _setPrefItemToCart();
    notifyListeners();
  }

  void _setPrefItemToCart() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('selected', _isSelected);
    notifyListeners();
  }

  void _getPrefItemToCart() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.getBool('selected') ?? false;
    notifyListeners();
  }

  getSelectedItem() {
    _getPrefItemToCart();
    //notifyListeners();
    return _isSelected;
  }
}
