import 'package:e_commerce_app/core/services/db_helper.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OrderItemViewModel with ChangeNotifier {
  DbHelper dbHelper = DbHelper();
  final List<CartModel> _cartItem = [];
  int _qty = 0;
  int _itemPrice = 0;

  List<CartModel> get cartItem => _cartItem;

  int get qty => _qty;

  int get itemPrice => _itemPrice;

  @override
  dispose() {
    super.dispose();
    resetValue();
  }

  OrderItemViewModel() {

    showData();
  }

   Future<List<CartModel>?> showData() async {

    List<CartModel>? data = await dbHelper.getDbData();
    _cartItem.addAll(data!);

  }

  incrementProductQty({
    int? index,
    int? id,
    int? price,
  }) {
    final idx = _cartItem.any((element) => element.itemId == id);

    if (idx == true) {
      _cartItem[index!].itemQty = _cartItem[index].itemQty! + 1;
      _cartItem[index].itemTotalPrices =
          _cartItem[index].itemQty! * price!.toDouble();
      notifyListeners();
    } else {
      _qty = _qty + 1;
      _itemPrice = _qty * price!;
      notifyListeners();
    }

    // final index = productViewModel.productModelView!
    //     .indexWhere((ProductModel product) => product.id == id);
    // if (index >= 0) {
    //   productViewModel.productModelView?[index].itemQty = _qty++;
    //   _itemPrice = _qty * price;
    //   print(_qty);
    //   notifyListeners();
    // }
  }

  decrementProductQty({
    int? index,
    int? id,
    int? price,
  }) {
    final idx = _cartItem.any((element) => element.itemId == id);

    if (idx == true) {
      if (_cartItem[index!].itemQty! > 0) {
        _cartItem[index].itemQty = _cartItem[index].itemQty! - 1;
        _cartItem[index].itemTotalPrices =
            _cartItem[index].itemQty! * price!.toDouble();
        notifyListeners();
      } else {
        null;
      }
    } else {
      if (_qty > 0) {
        _qty = _qty - 1;
        _itemPrice = _qty * price!;
        notifyListeners();
      } else {
        return null;
      }
    }

    // final index = productViewModel.productModelView!
    //     .indexWhere((ProductModel product) => product.id == id);
    // if (_qty > 0) {
    //   productViewModel.productModelView?[index].itemQty = _qty--;
    //   _itemPrice = _qty * price;
    //   print(_qty);
    //   notifyListeners();
    // } else {
    //   return null;
    // }
  }

  orderItemTotalPrice({int? index, int? id}) {
    for (var element in _cartItem) {
      if (element.itemId == id) {
        return element.itemTotalPrices;
      }
    }
    return _itemPrice;
  }

  resetValue({int? id}) {
    var ids = _cartItem.any((element) => element.itemId == id);
    if (ids == true) {
      return null;
    } else {
      _qty = 0;
      _itemPrice = 0;
    }
  }

  getItemQty({int? id}) {
    for (var element in _cartItem) {
      if (element.itemId == id) {
        return element.itemQty;
      }
    }
    return _qty;
  }
}
