import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ItemCategoryViewModel extends ChangeNotifier {
  List<Product>? _catItem = [];

  List<Product>? get catItem => _catItem;



   List<Product>? getCatItem(List<Product>? products,String cat)  {
    // products = productViewModel!.productModelView!.products;
    final item = products?.where((element) => element.category == cat).toList();

    return item;
  }
}
