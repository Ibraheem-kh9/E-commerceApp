import 'package:e_commerce_app/view/screens/auth_screens/reset_password_sc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sizer/sizer.dart';
import '../../../components/app_local.dart';
import '../../../utils/constant_color.dart';
import '../../widgets/forgot_password_widgets/forgot_appbar.dart';
import '../../widgets/forgot_password_widgets/forgot_test_widget.dart';
import '../../widgets/login_screen_widget/login_button_widget.dart';

class OtpCodeSc extends StatelessWidget {
  const OtpCodeSc({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocale locale = AppLocale.of(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundPageViewColor,
      appBar: const ForgotAppBarWidget(),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Image.asset(
            'assets/images/login_process/otp_verify.png',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 3.5.h,
              left: 3.5.h,
              top: 2.h,
              bottom: 2.h,
            ),
            child: ForgotTextWidget(
              text: locale.getTranslated('otp_code_title')!, //'Enter OTP',
              fontFamily: 'Times',
              fontWeight: FontWeight.bold,
              color: AppColor.kMainColor,
              size: 25.sp,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                right: 3.5.h,
                left: 3.5.h,
                top: 0.2.h,
                bottom: 2.h,
              ),
              child: ForgotTextWidget(
                text: locale.getTranslated('otp_code_desc')!,  //'An 5 digit code has been sent to test@gmail.com.',
                fontFamily: 'Times',
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.7),
                size: 12.sp,
              )),
          SizedBox(
            height: 3.h,
          ),
          OtpTextField(
            numberOfFields: 5,
            hasCustomInputDecoration: true,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.kIconColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.kMainColor)),
            ),
            autoFocus: true,
            clearText: true,
            onCodeChanged: (value) {},
            onSubmit: (num) {},
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginButtonWidget(
                fixedSize: MaterialStatePropertyAll<Size>(Size(35.w, 6.h)),
                buttonColor: AppColor.validateColor,
                onPress: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResetPasswordSc();
                      },
                    ),
                  );
                },
                textButton: locale.getTranslated('otp_code_validate_button_text')!,
              ),
              LoginButtonWidget(
                fixedSize: MaterialStatePropertyAll<Size>(Size(35.w, 6.h)),
                buttonColor: AppColor.cancelColor,
                onPress: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResetPasswordSc();
                      },
                    ),
                  );
                },
                textButton: locale.getTranslated('otp_code_cancel_button_text')!,
              ),
            ],
          )
        ],
      ),
    );
  }
}
