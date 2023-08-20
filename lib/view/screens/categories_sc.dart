import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/screens/item_category_sc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../view_model/category_view_model.dart';
import '../../view_model/product_view_model.dart';

class CategoriesSc extends StatelessWidget {
  const CategoriesSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel catViewModel = context.watch<CategoryViewModel>();
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemCount: catViewModel.getCategoryTitle(productViewModel.productModelView!.products!).length,
          //itemCount: catViewModel.categoryModel!.length,
          itemBuilder: (context, index) {
            var catItems = productViewModel.productModelView!.products!;
            if (catItems.isEmpty) {
              Center(
                  child: Text(
                'No Category Found',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              );
            }
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 1.5.h, top: 1.h, right: 1.5.h),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 1.h),
                  height: 7.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4.h,
                            //borderRadius: BorderRadius.all(Radius.circular(100)),
                            child: Image.asset(
                              catViewModel.categoryModel![index].categoryImage,
                              //scale: 10.0,
                            ),
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          Text(
                            catViewModel.getCategoryTitle(catItems)[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                     //     Navigator.pushNamed(context, AppRoute.itemCategory,arguments: catViewModel.getCategoryItem(catItems)[index],
                      //    );
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ItemCategorySc(catItems: catItems,categoryItemName: catViewModel.catTitle![index],);
                          }));
                        },
                        icon: Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColor.kMainColor,
                          size: 16.sp,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  endIndent: 2.h,
                  indent: 2.h,
                  thickness: 0.05.h,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
