import 'package:e_commerce_app/models/favorite_model.dart';
import 'package:e_commerce_app/models/products_error.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/repo/api_status.dart';
import 'package:e_commerce_app/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductViewModel with ChangeNotifier {
  bool _loading = false;
  ProductModel? _productModelView;
  UserError _userError = UserError();
  int currentIndexBar = 0;
  bool isExpanded = false;

  /// change int to double and add final
  final double _cartPrice = 0.0;


  bool get loading => _loading;
  ProductModel? get productModelView => _productModelView;
  UserError get userError => _userError;

  double get cartPrice => _cartPrice;

  ProductViewModel() {
    getProducts();
  }
  setFavoriteCheck(int index) {
    _productModelView!.products![index].isFavorite =
    !_productModelView!.products![index].isFavorite!;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }
  setExpanded() async {
    isExpanded = !isExpanded;
    print(isExpanded);
    notifyListeners();
  }
  setItemZero(int id) {
    final index = productModelView!.products!
        .indexWhere((Product product) => product.id == id);
    productModelView!.products![index].quantity = 0;
    notifyListeners();
  }
  setProductModelList(ProductModel productModelList) {
    _productModelView = productModelList;
  }
  // setProductModelList(ProductModel productModelList) {
  //   _productModelView = productModelList;
  // }

  setError(UserError error) {
    _userError = error;
  }



  getProducts() async {

    setLoading(true);
    var response = await UsersServices().getProducts();
    print(response);
    if (response is Success) {
      setProductModelList(response.response as ProductModel);
    }
    if (response is Failure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse.toString());
      setError(userError);
      print(response.errorResponse);
    }
    setLoading(false);

  }

  incrementProductQty(int id) {
    final index = productModelView?.products!
        .indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
      productModelView?.products![index].quantity++;
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

  /// change int to double
  itemTotalPriceIncrease({int? id, int? itemQty, double? price, double? perc}) {
    final index = productModelView?.products!
        .indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
      productModelView?.products![index].totalProductPrice =
      /// add toDouble
          (itemQty! * calcPriceWithPercentage(price!.toDouble(), perc!)).toDouble();
      notifyListeners();
    }
    print(productModelView?.products![index].totalProductPrice);
  }
/// change int to double
  itemTotalPriceDecrease({int? id, int? itemQty, double? price, double? perc}) {
    final index = productModelView?.products!
        .indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
      var total = productModelView?.products![index].totalProductPrice =
          (itemQty! * calcPriceWithPercentage(price!, perc!)).toDouble();
      total! - 1;

      notifyListeners();
      return total;
    }
    print(productModelView?.products![index].totalProductPrice);
  }
  /// change int to double
  calcPriceWithPercentage(double amount, double perc) {
    var num = (amount * perc / 100);
    var totalPrice = amount - num;
    return totalPrice.floor();
  }

  selectedScreenBar(int idx) {
    idx = currentIndexBar;
    notifyListeners();
  }



}
