import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/view_model/item_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math';
import '../../models/products_model.dart';
import '../../view_model/category_view_model.dart';

class ItemCategorySc extends StatelessWidget {
  final List<Product>? catItems;
  final String? categoryItemName;

  const ItemCategorySc({super.key, this.catItems, this.categoryItemName});

  @override
  Widget build(BuildContext context) {
    final itemCategoryViewModel = Provider.of<ItemCategoryViewModel>(context);
    //Product data = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: itemCategoryViewModel
              .getCatItem(catItems, categoryItemName!)!
              .length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${itemCategoryViewModel.getCatItem(catItems, categoryItemName!)![index].title}',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
