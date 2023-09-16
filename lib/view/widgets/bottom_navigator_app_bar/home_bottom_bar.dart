import 'package:e_commerce_app/core/utils/constants/constant_color.dart';

import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_button_app_bar_widget.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return BottomAppBar(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsets.zero,
      elevation: 0,
      color: AppColor.backgroundPageViewColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(
            productViewModel.screensView.length + 1,
            (index) => index == 2
                ? const Spacer()
                : CustomButtonAppBar(
                    onPress: () {
                      productViewModel
                          .selectedScreenBar(index > 2 ? index - 1 : index);
                    },
                    icon: productViewModel
                        .iconBottomAppBar[index > 2 ? index - 1 : index],
                    text: productViewModel
                        .titleBottomAppBar[index > 2 ? index - 1 : index],
                    active: productViewModel.currentIndexBar ==
                            (index > 2 ? index - 1 : index)
                        ? true
                        : false,
                  ),
          ),
        ],
      ),
    );
  }
}
