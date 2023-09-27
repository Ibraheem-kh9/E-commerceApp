import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/constants/app_routes.dart';
import '../../../../core/utils/constants/constant_color.dart';
import '../../../widgets/forgot_password_widgets/forgot_appbar.dart';
import '../../../widgets/forgot_password_widgets/forgot_test_widget.dart';
import '../../../widgets/login_screen_widget/login_button_widget.dart';
import '../../../widgets/login_screen_widget/login_textform_field_widget.dart';

class ResetPasswordSc extends StatelessWidget {
  const ResetPasswordSc({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocale locale = AppLocale.of(context);
    final authViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundPageViewColor,
      appBar: const ForgotAppBarWidget(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.h),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Image.asset(
            'assets/images/login_process/reset_password.png',
            fit: BoxFit.fill,
          ),
          ForgotTextWidget(
            text: locale.getTranslated('reset_pass_title')!,
            fontFamily: 'Times',
            fontWeight: FontWeight.bold,
            color: AppColor.kMainColor,
            size: 25.sp,
          ),
          SizedBox(
            height: 3.h,
          ),
          LoginTextFormFieldWidget(
            textEditingController: authViewModel.logPasswordCtrl,
            hintText: locale.getTranslated('reset_pass_pass_hint')!,
            formIcon: Icons.lock_outline,
            textInputType: TextInputType.visiblePassword,
            obscureText: authViewModel.passToggle,
            suffixWidget: InkWell(
              onTap: () {
                authViewModel.setLogPassToggle();
              },
              child: Icon(authViewModel.passToggle
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            validateAction: (value) {
              if (value!.isEmpty) {
                return 'Enter Password';
              } else if (value.length < 6) {
                return 'password should not be less than 6 digits';
              }
              return null;
            },
          ),
          LoginTextFormFieldWidget(
            textEditingController: authViewModel.logPasswordCtrl,
            hintText: locale.getTranslated('reset_pass_pass_hint_confirm')!,
            formIcon: Icons.lock_outline,
            textInputType: TextInputType.visiblePassword,
            obscureText: authViewModel.passToggle,
            suffixWidget: InkWell(
              onTap: () {
                authViewModel.setLogPassToggle();
              },
              child: Icon(authViewModel.passToggle
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            validateAction: (value) {
              if (value!.isEmpty) {
                return 'Enter Password';
              } else if (value.length < 6) {
                return 'password should not be less than 6 digits';
              }
              return null;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          LoginButtonWidget(
            fixedSize: MaterialStatePropertyAll<Size>(Size(90.w, 5.5.h)),
            buttonColor: AppColor.kMainColor.withOpacity(0.8),
            onPress: () async {
              Navigator.pushNamed(context, AppRoute.confirmPassPage);
            },
            textButton: locale.getTranslated('reset_pass_button_text')!,
          ),
        ],
      ),
    );
  }
}
