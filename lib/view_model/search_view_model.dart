import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';

class SearchViewModel with ChangeNotifier {
  List<ProductModel>? _productModelView;
  final Set<ProductModel> _resultList = {};

  List<ProductModel>? get productModelView => _productModelView;

  Set<ProductModel>? get resultList => _resultList;

  String searchText = '';

  updateData(ProductViewModel? productModelData) {
    try {
      if (searchText.isEmpty) {
        _resultList.clear();
      } else {
        _resultList.addAll(
          productModelData!.productModelView!.where((element) {
            final title = element.title!.toLowerCase();
            final brand = element.brand!.toLowerCase();
            final searchLower = searchText.toLowerCase();
            return title.startsWith(searchLower) ||
                brand.startsWith(searchLower);
          }).toList(),
        );
      }
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  searchProduct({String? value, ProductViewModel? productModelData}) {
    searchText = value!;
    updateData(productModelData);
  }
}
