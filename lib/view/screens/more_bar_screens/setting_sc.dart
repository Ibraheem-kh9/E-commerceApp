import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/change_language_sc.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:e_commerce_app/view_model/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/app_routes.dart';
import '../auth_screens/login_page_sc.dart';

class SettingSc extends StatelessWidget {
  const SettingSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<LoginViewModel>(context);
    final settingViewModel = Provider.of<SettingViewModel>(context);
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // shrinkWrap: true,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 0.5.h,right: 0.5.h,bottom: 2.h),
                    padding: EdgeInsets.only(left: 2.h),
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kMainColor.withOpacity(0.5))
                    ),
                    child: Text(
                      //settingViewModel.usersModel.name!,
                      authViewModel.authService.firebaseAuth.currentUser!.email!,
                      //appLocale.getTranslated('setting_notification')!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Card(
                    shape: OutlineInputBorder(borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
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
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    shape: OutlineInputBorder(borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
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
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    shape: OutlineInputBorder(borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
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
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    shape: OutlineInputBorder(borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
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
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  Card(
                    shape: OutlineInputBorder(borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
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
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    authViewModel.signOut();
                   // Navigator.pushReplacementNamed(context, AppRoute.login);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
                    backgroundColor: const MaterialStatePropertyAll(AppColor.kIconColor),
                  ),
                  child: Text(appLocale.getTranslated('setting_sign_out')!,style: TextStyle(fontSize: 16.sp),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
