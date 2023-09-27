import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_button_widget.dart';
import 'package:e_commerce_app/view/widgets/register_email_verified_widget/mail_verif_text_section.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:e_commerce_app/view_model/register/mail_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/constants/constant_color.dart';

class RegisterEmailVerifiedSc extends StatefulWidget {
  const RegisterEmailVerifiedSc({super.key});

  @override
  State<RegisterEmailVerifiedSc> createState() =>
      _RegisterEmailVerifiedScState();
}

class _RegisterEmailVerifiedScState extends State<RegisterEmailVerifiedSc> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MailVerificationViewModel>().verifyEmail();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mailVerification = Provider.of<MailVerificationViewModel>(context);
    AppLocale localeLang = AppLocale.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/login_process/email_verification.png',
              fit: BoxFit.fitWidth,
            ),

             RegVerifiedTextSection(
              text: localeLang.getTranslated('register_email_verified_description')!,
            ),

            Padding(
              padding:EdgeInsets.only(left: 10.h, right: 10.h),
              child: LoginButtonWidget(
                  onPress: () => mailVerification.canResendLinkVerify == true
                      ? mailVerification.sendVerificationMail()
                      : null,
                  textButton: localeLang.getTranslated('register_email_verified_btn_resend')!,
                  buttonColor: mailVerification.canResendLinkVerify
                      ? AppColor.kMainColor
                      : Colors.grey,
                  fixedSize: MaterialStatePropertyAll(Size(20.h, 8.h))),
            ),
            TextButton(
              onPressed: () {
                context.read<LoginViewModel>().signOut();
                Navigator.pushReplacementNamed(context, AppRoute.login);
              },
              child: Text(
                localeLang.getTranslated('register_email_verified_btn_cancel')!,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColor.kIconColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
