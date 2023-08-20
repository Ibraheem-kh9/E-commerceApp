
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

  // @override
  // void dispose() {
  //   context.dependOnInheritedWidgetOfExactType()
  //     //context.read<MailVerificationViewModel>().timer!.cancel();
  //
  //
  //
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final mailVerification = Provider.of<MailVerificationViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/login_process/email_verification.png',
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Verification E-mail has been sent to your email,\n please check email to complete register ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: ElevatedButton(
                onPressed: () => mailVerification.canResendLinkVerify == true
                    ? mailVerification.sendVerificationMail()
                    : null,
                style: ButtonStyle(
                  backgroundColor: mailVerification.canResendLinkVerify
                      ? const MaterialStatePropertyAll(AppColor.kMainColor)
                      : const MaterialStatePropertyAll(Colors.grey),
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  fixedSize: MaterialStatePropertyAll(Size.fromHeight(5.h)),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.h),
                      ),
                    ),
                  ),
                  elevation: const MaterialStatePropertyAll(0.0),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(
                  'Resend Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                context.read<LoginViewModel>().signOut();
                 Navigator.pushReplacementNamed(context, AppRoute.login);
                //verifyEmail.signOut();
              },
              child: Text(
                'Cancel',
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
