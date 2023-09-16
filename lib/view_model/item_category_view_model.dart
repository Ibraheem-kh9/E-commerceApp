import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ItemCategoryViewModel extends ChangeNotifier {
  List<ProductModel>? _catItem = [];
  late int _currentIdx = 0;
  List<ProductModel>? get catItem => _catItem;
  int get currentIdx => _currentIdx;

  setImageIndex(int val){
    _currentIdx = val;
    notifyListeners();
  }

   List<ProductModel>? getCatItem(List<ProductModel>? products,String cat)  {
    // products = productViewModel!.productModelView!.products;
    final item = products?.where((element) => element.category == cat).toList();

    return item;
  }
}
