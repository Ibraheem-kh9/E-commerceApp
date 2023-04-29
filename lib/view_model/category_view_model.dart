import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/utils/get_tems_categories.dart';
import 'package:flutter/material.dart';

class CategoryViewModel with ChangeNotifier {
  final List<CategoryModel> _categoryModel = [];

  List<CategoryModel>? get categoryModel => _categoryModel;

  CategoryViewModel() {
    addCategory();
  }

  addCategory() {
    try {
      dynamic result = GetItemsCategories().getMockedItemsData;
      result.forEach((CategoryModel cat) {
        _categoryModel.add(cat);
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
