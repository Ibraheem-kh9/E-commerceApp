import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/search_widget.dart';
import 'package:e_commerce_app/view/widgets/main_app_bar_widget/main_appbar_widget.dart';
import 'package:e_commerce_app/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/constants/constant_color.dart';
import '../../view_model/product_view_model.dart';

class SearchSc extends StatelessWidget {
  const SearchSc({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewModel searchViewModel = Provider.of<SearchViewModel>(context);
    final productModel =
        ModalRoute.of(context)!.settings.arguments as ProductViewModel;
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      appBar: MainAppbarWidget(
        appbarTitle: 'TasawQ',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 1.5.h,
            right: 1.5.h,
            top: 1.h,
            bottom: 2.h,
          ),
          child: Column(
            children: [
              SearchTxtWidget(
                textInputType: TextInputType.text,
                autoFocus: true,
                onChange: (value) => searchViewModel.searchProduct(
                    value: value, productModelData: productModel),
              ),
              Consumer<SearchViewModel>(builder: (context, notify, child) {
                return Expanded(
                  flex: 8,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 2.h),
                    shrinkWrap: false,
                    itemCount: searchViewModel.resultList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        color: AppColor.kBackgroundContainer,
                        child: ListTile(
                          leading: SizedBox(
                            width: 20.w,
                            height: 15.h,
                            child: Image.network(
                              searchViewModel.resultList!
                                  .elementAt(index)
                                  .thumbnail!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(searchViewModel.resultList!
                              .elementAt(index)
                              .title!),
                          trailing: Text(searchViewModel.resultList!
                              .elementAt(index)
                              .brand!),
                          subtitle: Text(searchViewModel.resultList!
                              .elementAt(index)
                              .category!
                              .toString()),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: AppColor.kIconColor,
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
