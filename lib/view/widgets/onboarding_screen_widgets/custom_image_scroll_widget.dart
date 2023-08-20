/*
import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/app_language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/constants/constant_color.dart';
import '../../../utils/static_onboard.dart';
import '../../../view_model/onboarding_view_model.dart';

class CustomImageScrollWidget extends StatelessWidget {
  const CustomImageScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingViewModel>(
      builder: (context, notify, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoarding.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.only(right: 1.h),
                width: notify.currentIndex == index ? 1.7.h : 1.h,
                height: notify.currentIndex == index ? 1.7.h : 1.h,
                decoration: notify.currentIndex != index
                    ? BoxDecoration(
                  border: Border.all(
                    color: AppColor.kMainColor,
                    width: 0.2.h,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.h),
                  ),
                )
                    : BoxDecoration(
                  color: AppColor.kIconColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.h),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
*/








import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../core/utils/static_onboard.dart';
import '../../../view_model/onboarding_view_model.dart';

class CustomImageScrollWidget extends StatelessWidget {
  const CustomImageScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final boradingViewModel = Provider.of<OnBoardingViewModel>(context);
    return Consumer<OnBoardingViewModel>(
      builder: (context, notify, child) {

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 12.h,
              height: 1.3.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                controller: boradingViewModel.scrollController,
                  itemCount: onBoarding.length,
                  itemBuilder: (context,index){
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: EdgeInsets.only(right: 1.h),
                      width: notify.currentIndex == index ? 3.h : 1.h,
                      height: notify.currentIndex == index ? 1.7.h : 1.h,
                      decoration: notify.currentIndex != index
                          ? BoxDecoration(
                        border: Border.all(
                          color: AppColor.kMainColor,
                          width: 0.2.h,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.h),
                        ),
                      )
                          : BoxDecoration(
                        color: AppColor.kIconColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.h),
                        ),
                      ),
                    );
                  }),
            )

          ],
        );
      },
    );
  }
}
