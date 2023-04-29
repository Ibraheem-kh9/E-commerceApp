import 'package:e_commerce_app/models/products_error.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/repo/api_status.dart';
import 'package:e_commerce_app/repo/product_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserViewModel with ChangeNotifier {
  bool _loading = false;
  ProductModel? _productModelView;
  UserError _userError = UserError();
  int currentIndexBar = 0;
  bool isExpanded = false;
  AnimationController? _controller;

  bool get loading => _loading;

  ProductModel? get productModelView => _productModelView;

  UserError get userError => _userError;

  //bool get expanded => _isExpanded;

  UserViewModel() {
    getUser();
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

  setProductModelList(ProductModel productModelList) {
    _productModelView = productModelList;
  }

  setError(UserError error) {
    _userError = error;
  }

  getUser() async {
    setLoading(true);
    var response = await UsersServices().getUsers();
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

  selectedScreenBar(int idx) {
    idx = currentIndexBar;
    notifyListeners();
  }

  calcPriceWithPercentage(int amount, int perc) {
    var num = (amount * perc / 100);
    var totalPrice = amount - num;
    return totalPrice.floor();
  }

  refreshPage() async {
    //return Future.delayed(Duration(seconds: 3),()=>getUser());
    await getUser();
  }
}
