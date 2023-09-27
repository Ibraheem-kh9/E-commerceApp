import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/core/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/widgets/forgot_password_widgets/forgot_appbar.dart';
import 'package:e_commerce_app/view/widgets/forgot_password_widgets/forgot_test_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_textform_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../view_model/register/reset_password_view_model.dart';
import '../../../widgets/login_screen_widget/login_button_widget.dart';

class ForgetPasswordSc extends StatelessWidget {
  const ForgetPasswordSc({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordViewModel = Provider.of<ResetPasswordViewModel>(context);
    AppLocale locale = AppLocale.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundPageViewColor,
      appBar: const ForgotAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(
          right: 3.5.h,
          left: 3.5.h,
          top: 2.h,
          bottom: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          //physics: const NeverScrollableScrollPhysics(),
          children: [
            Image.asset(
              'assets/images/login_process/forget_password.png',
              fit: BoxFit.fill,
            ),
            ForgotTextWidget(
              text: locale.getTranslated('forgot_pass_title')!,
              fontFamily: 'Times',
              fontWeight: FontWeight.bold,
              color: AppColor.kMainColor,
              size: 25.sp,
            ),
            ForgotTextWidget(
              text: locale.getTranslated('forgot_pass_desc')!,

              ///'Don\'t worry! It happen. Please Enter the address associated with your Account.',
              fontFamily: 'Times',
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.7),
              size: 12.sp,
            ),
            LoginTextFormFieldWidget(
              textEditingController:
                  resetPasswordViewModel.resetPasswordEditingCtrl,
              hintText: locale.getTranslated('forgot_pass_email_hint')!,
              formIcon: Icons.mail_outline,
              textInputType: TextInputType.emailAddress,
              validateAction: (val) {
                return null;
              },
            ),
            LoginButtonWidget(
              buttonColor: AppColor.kMainColor.withOpacity(0.8),
              fixedSize: MaterialStatePropertyAll<Size>(Size(90.w, 6.h)),
              onPress: () async {
                resetPasswordViewModel.sendResetPasswordEmail();
                resetPasswordViewModel.resetPasswordEditingCtrl.clear();
              },
              textButton: locale.getTranslated('forgot_pass_button_text')!,
            ),
          ],
        ),
      ),
    );
  }
}
