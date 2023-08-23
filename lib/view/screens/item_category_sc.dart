import 'package:e_commerce_app/view/main_appbar_widget.dart';
import 'package:e_commerce_app/view/screens/category_item_order_sc.dart';
import 'package:e_commerce_app/view/widgets/item_category_widget/custom_category_image_widget.dart';
import 'package:e_commerce_app/view/widgets/item_category_widget/custom_item_brand_widget.dart';
import 'package:e_commerce_app/view/widgets/item_category_widget/custom_item_price_disc_widget.dart';
import 'package:e_commerce_app/view/widgets/item_category_widget/custom_item_title_widget.dart';
import 'package:e_commerce_app/view/widgets/secondary_appbar_widget.dart';
import 'package:e_commerce_app/view_model/item_category_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../models/products_model.dart';

class ItemCategorySc extends StatelessWidget {
  final List<Product>? catItems;
  final String? categoryItemName;
  final int? index;

  const ItemCategorySc({super.key, this.catItems, this.categoryItemName, this.index});

  @override
  Widget build(BuildContext context) {
    final itemCategoryViewModel = Provider.of<ItemCategoryViewModel>(context);
    final productViewModel = Provider.of<ProductViewModel>(context);
    //Product data = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: SecondaryAppbarWidget(
          appbarLeading: 'Categories',
        appbarTitle: categoryItemName,
      ),
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(1.5.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1.5.h,
            crossAxisSpacing: 1.5.h,
            mainAxisExtent: 38.h,
          ),
          itemCount: itemCategoryViewModel
              .getCatItem(catItems, categoryItemName!)!
              .length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CategoryItemOrderSc(
                    product: itemCategoryViewModel.getCatItem(
                        catItems, categoryItemName!)![index],
                    categoryItemName: categoryItemName,
                  );
                }));
                 /*Navigator.pushNamed(context, AppRoute.itemCategory,
                   arguments: itemCategoryViewModel.getCatItem(catItems, categoryItemName!)!,
                );*/
              },
              child: Container(
                padding: EdgeInsets.only(left: 1.h, right: 1.h),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2.5.h))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCategoryImageWidget(
                      imageUrl: itemCategoryViewModel
                          .getCatItem(catItems, categoryItemName!)![index]
                          .thumbnail!,
                    ),
                    CustomItemTitleWidget(
                        title: itemCategoryViewModel
                            .getCatItem(catItems, categoryItemName!)![index]
                            .title!),
                    CustomItemBrandWidget(
                        subTitle: itemCategoryViewModel
                            .getCatItem(catItems, categoryItemName!)![index]
                            .brand!),
                    CustomItemPriceDiscWidget(
                      price: itemCategoryViewModel
                          .getCatItem(catItems, categoryItemName!)![index]
                          .price!,
                      discount: itemCategoryViewModel
                          .getCatItem(catItems, categoryItemName!)![index]
                          .discountPercentage!
                          .floor(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
