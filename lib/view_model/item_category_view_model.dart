import 'package:flutter/material.dart';
import '../models/products_model.dart';

class ItemCategoryViewModel extends ChangeNotifier {
  late int _currentIdx = 0;
  int get currentIdx => _currentIdx;

  setImageIndex(int val){
    _currentIdx = val;
    notifyListeners();
  }

   List<ProductModel>? getCatItem(List<ProductModel>? products,String cat)  {
    final item = products?.where((element) => element.category == cat).toList();
    return item;
  }
}
