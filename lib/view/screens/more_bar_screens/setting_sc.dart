import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/screens/change_language_sc.dart';
import 'package:e_commerce_app/view_model/authenticate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'auth_screens/login_page_sc.dart';

class SettingSc extends StatelessWidget {
  const SettingSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthenticateViewModel>(context);
    AppLocale appLocale = AppLocale.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kMainColor,
        title: Text(appLocale.getTranslated('setting_profile')!,style: TextStyle(
          fontSize: 17.sp,
          color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 7.h,
                    child: Icon(Icons.account_circle,size: 14.h,),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kMainColor
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 5.h,left: 5.h),
                height: 35.h,
                decoration: BoxDecoration(
                  color: AppColor.kMainColor.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(2.h))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // shrinkWrap: true,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginSc();
                          }));
                        },
                        child: Text(
                          appLocale.getTranslated('setting_notification')!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5.sp,
                      indent: 5.h,
                      endIndent: 5.h,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginSc();
                          }));
                        },
                        child: Text(
                          appLocale.getTranslated('setting_my_order')!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5.sp,
                      indent: 5.h,
                      endIndent: 5.h,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginSc();
                          }));
                        },
                        child: Text(
                          appLocale.getTranslated('setting_edit_profile')!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5.sp,
                      indent: 5.h,
                      endIndent: 5.h,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginSc();
                          }));
                        },
                        child: Text(
                          appLocale.getTranslated('setting_change_password')!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5.sp,
                      indent: 5.h,
                      endIndent: 5.h,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ChangeLanguageSc();
                          }));
                        },
                        child: Text(
                          appLocale.getTranslated('setting_language')!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      authViewModel.signOut();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
                      backgroundColor: MaterialStatePropertyAll(AppColor.kIconColor),
                    ),
                    child: Text(appLocale.getTranslated('setting_sign_out')!,style: TextStyle(fontSize: 16.sp),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
