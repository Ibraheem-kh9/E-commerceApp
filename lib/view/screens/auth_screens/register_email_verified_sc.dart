import 'package:e_commerce_app/utils/constants/app_routes.dart';
import 'package:e_commerce_app/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/screens/homepage_sc.dart';
import 'package:e_commerce_app/view_model/register/mail_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterEmailVerified extends StatelessWidget {
  const RegisterEmailVerified({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyEmail = Provider.of<MailVerificationViewModel>(context);
    return verifyEmail.isVerified ? HomepageSc() : Scaffold(
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
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.kMainColor),
                  fixedSize: MaterialStatePropertyAll(Size.fromHeight(5.h)),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.h),
                      ),
                    ),
                  ),
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
                  Navigator.popUntil(context, ModalRoute.withName('/register'));
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColor.kIconColor.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
