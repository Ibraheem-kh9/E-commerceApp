import 'package:e_commerce_app/view/screens/item_category_sc.dart';
import 'package:e_commerce_app/view/widgets/categories_widget/custom_avatar_widget.dart';
import 'package:e_commerce_app/view/widgets/categories_widget/custom_category_btn_widget.dart';
import 'package:e_commerce_app/view/widgets/categories_widget/custom_category_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
        child: 
        ListView.separated(
          separatorBuilder: (context,int index){
            return Divider(
              endIndent: 2.h,
              indent: 2.h,
              thickness: 0.09.h,
              color: Colors.grey,
            );
          },
          itemCount: catViewModel.getCategoryTitle(productViewModel.productModelView!).length,
          itemBuilder: (context, index) {
            var catItems = productViewModel.productModelView!;
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
                          CustomAvatarWidget(imageName: catViewModel.categoryModel![index].categoryImage),
                          SizedBox(
                            width: 1.h,
                          ),
                          CustomCategoryNameWidget(title: catViewModel.getCategoryTitle(catItems)[index]),
                        ],
                      ),
                      CustomCategoryBtnWidget(onPress: () {
                        //     Navigator.pushNamed(context, AppRoute.itemCategory,arguments: catViewModel.getCategoryItem(catItems)[index],
                        //    );
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ItemCategorySc(catItems: catItems,categoryItemName: catViewModel.catTitle![index],index: index,);
                        }));
                      },)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
