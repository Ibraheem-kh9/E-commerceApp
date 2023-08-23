import 'package:e_commerce_app/view/widgets/home_screen_widget/bottom_navigator_app_bar/custom_button_app_bar_widget.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return BottomAppBar(
      elevation: 0,
      color: Colors.white.withOpacity(0.8),
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
