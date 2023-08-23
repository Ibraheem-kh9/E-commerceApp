import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import '../core/utils/get_tems_categories.dart';

class CategoryViewModel with ChangeNotifier {

  ProductViewModel? productViewModel;
  final List<CategoryModel> _categoryModel = [];
  final List<String> _catTitle = [];


  List<CategoryModel>? get categoryModel => _categoryModel;
  List<String>? get catTitle => _catTitle;


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

  List<String> getCategoryTitle(List<Product> category) {
    try{

      for (var e in category) {
        !_catTitle.contains(e.category) == true ?  _catTitle.add(e.category!) : const Text('no Data Found');
      }
      return _catTitle;
    }catch(e){
     Text(e.toString());
    }
    return [];
  }




}
