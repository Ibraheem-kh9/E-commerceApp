import 'package:e_commerce_app/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/widgets/onboarding_screen_widgets/custom_button_pageview_widget.dart';
import 'package:e_commerce_app/view/widgets/onboarding_screen_widgets/custom_image_scroll_widget.dart';
import 'package:e_commerce_app/view/widgets/onboarding_screen_widgets/custom_pageview_widget.dart';
import 'package:e_commerce_app/view_model/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OnBoardingSc extends StatelessWidget {
  const OnBoardingSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingVModel = Provider.of<OnBoardingViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundPageViewColor,
      body: SafeArea(
        child: Column(
          children: [
            //// PageView Widget -----------------------------------------------
            Expanded(
              flex: 3,
              child:
                  CustomPageViewWidget(onBoardingViewModel: onBoardingVModel),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  //// Image Scroll Widget -------------------------------------
                  CustomImageScrollWidget(),
                  SizedBox(
                    height: 4.h,
                  ),

                  //// Button change image view and navigate to next page ------
                  CustomButtonPageViewWidget(
                      onBoardingViewModel: onBoardingVModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
