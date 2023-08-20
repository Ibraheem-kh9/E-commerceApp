import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/static_onboard.dart';

class CustomPageViewWidget extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;

  const CustomPageViewWidget({super.key, required this.onBoardingViewModel});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingViewModel.pageController,
      onPageChanged: (val) {
        onBoardingViewModel.onChangePageView(val);
      },
      itemCount: onBoarding.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onBoarding[index].image!,
              fit: BoxFit.fitWidth,
              height: 50.h,
              colorBlendMode: BlendMode.color,
            ),
            SizedBox(
              width: 38.w,
              child: Text(
                AppLocale.of(context).getTranslated(onBoarding[index].title!).toString(),
                style: Theme.of(context).textTheme.displayLarge,
                overflow: TextOverflow.visible,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.h, left: 6.h),
              child: Text(
                AppLocale.of(context).getTranslated(onBoarding[index].description!)!,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.visible,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    );
  }
}
