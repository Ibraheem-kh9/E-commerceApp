import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/constants/constant_color.dart';
import '../../../utils/static_onboard.dart';
import '../../screens/auth_screens/login_page_sc.dart';

class CustomButtonPageViewWidget extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;

  const CustomButtonPageViewWidget(
      {super.key, required this.onBoardingViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onBoardingViewModel.currentIndex < onBoarding.length - 1
            ? onBoardingViewModel.nextPage()
            : Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginSc(),
                ),
                (route) => false);
      },
      splashColor: Colors.transparent,
      elevation: 0.0,
      child: Text(
        onBoardingViewModel.currentIndex < onBoarding.length - 1
            ? AppLocale.of(context).getTranslated('swipe_continue')!
            : AppLocale.of(context).getTranslated('go_login')!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.kMainColor.withOpacity(0.8),
          fontFamily: 'Times',
        ),
      ),
    );
  }
}
