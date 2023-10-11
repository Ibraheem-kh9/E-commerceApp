import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:e_commerce_app/core/utils/constants/constant_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../core/services/db_helper.dart';
import '../models/cart_model.dart';
import '../myapp.dart';

class CartViewModel extends ChangeNotifier {
  final DbHelper _dbHelper = DbHelper();
  final AuthService _authService = AuthService();
  User? _user;

  DbHelper get dbHelper => _dbHelper;

  final List<CartModel> _addItemToCart = [];
  int _counter = 0;
  double _cartLineTotal = 0;
  int shipping = 3;

  int get counter => _counter;

  double get cartLineTotal => _cartLineTotal;

  List<CartModel> get addItemToCart => _addItemToCart;

  CartViewModel() {
    readCartData();
  }

  /// CRUD methods -------------------------------------------------------------

  Future<List<CartModel>?> readCartData() async {
    List<CartModel>? data = await _dbHelper.getDbData();
    //_addItemToCart.addAll(data!.map((e) => e) as Map<String, CartModel>);
    _addItemToCart.addAll(data!);
    return data;
  }

  insertItemToCart(CartModel cartModel,int id) async {

    _addItemToCart.add(cartModel);
    int response = await _dbHelper.insertDb(cartModel);
    print('$response of insert');
    notifyListeners();
    return response;
  }

  Future updateCartData({
    int? index,
    int? id,
  }) async {
    CartModel cartModel = CartModel(
      id: _addItemToCart[index!].itemId,
      itemName: _addItemToCart[index].itemName,
      itemPrice: _addItemToCart[index].itemPrice,
      itemImage: _addItemToCart[index].itemImage,
      itemId: _addItemToCart[index].itemId,
      itemQty: _addItemToCart[index].itemQty,
      itemTotalPrices: _addItemToCart[index].itemTotalPrices,
    );
    int? update = await _dbHelper.updateDb(cartModel: cartModel, id: id);
    _addItemToCart.add(cartModel);
    print(
        '${_addItemToCart[index].itemQty} , ${_addItemToCart[index].itemTotalPrices}, ${_addItemToCart[index].itemName}');
    print('$update of update');
    notifyListeners();
    return update;
  }

  removeItemFromCart({int? itemId}) async {
    int response = await _dbHelper.deleteItemFromCart(itemId!);
    _addItemToCart.removeWhere((element) => element.itemId == itemId);
    notifyListeners();
    return response;
  }

  //// end of CRUD methods -----------------------------------------------------

  /// counter of cart icon -----------------------------------------------------

  getCounter() {
    _getPrefItems();
    return _counter;
  }

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

  resetCounter() {
    _counter = 0;
    _setPrefItems();
    notifyListeners();
  }

  //// end of counter methods --------------------------------------------------

  double get cartSubPrice => _addItemToCart.fold(
        0,
        (dynamic previousValue, CartModel cartModel) =>
            previousValue + cartModel.itemTotalPrices,
      );

  double get cartTotalPrices {
    var total = cartSubPrice + shipping;
    return total;
  }

  setIsAddedStatus({int? id}) {
    for (var element in _addItemToCart) {
      if (element.itemId == id) {
        return Border.all(color: AppColor.kIconColor);
      }
    }
    return const Border();
  }

  /// shared preference methods ------------------------------------------------

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

  //// end of shared preference method -----------------------------------------

  saveOrder() async {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      // Prevent user from dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppColor.kMainColor,
                BlendMode.srcIn,
              ),
              child: Lottie.asset(
                'assets/lottie_files/loading_icon.json',
                width: 20.h,
                height: 20.h,
              ),
            ),
          ),
        );
      },
    );

    try {
      _user = _authService.firebaseAuth.currentUser;
      var firebase = _authService.firestore
          .collection('OrderDetails')
          .doc(_user!.email)
          .collection('orders')
          .doc();
      await firebase.set({
        'cart1': _addItemToCart.asMap().values.map((e) => e.toJson1()).toList(),
        'date': DateTime.now(),
        'total Amount': cartTotalPrices,
        'no of item' : _addItemToCart.length,
      });
      await _dbHelper.clearCartData();
      _addItemToCart.clear();
      resetCounter();
    } catch (e) {
      rethrow;
    }
    navigatorKey.currentState!.pop();
  }
}
