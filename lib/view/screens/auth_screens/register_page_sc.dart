import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_button_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_textform_field_widget.dart';
import 'package:e_commerce_app/view/widgets/register_page_widget/reg_page_header.dart';
import 'package:e_commerce_app/view_model/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/constants/constant_color.dart';

class RegisterPageSc extends StatelessWidget {
  const RegisterPageSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRegViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    AppLocale appLocale = AppLocale.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: authRegViewModel.registerFormFiledKey,
          child: Padding(
            padding: EdgeInsets.only(
                top: 7.h, bottom: 20.h, right: 2.5.h, left: 2.5.h),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: RegPageTextSection(
                    text: appLocale.getTranslated('sign_in_header')!,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kMainColor,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Divider(
                    indent: 5.h,
                    endIndent: 5.h,
                    thickness: 1.5,
                    color: AppColor.kIconColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RegPageTextSection(
                    text: appLocale.getTranslated('sign_in_title')!,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kMainColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: LoginTextFormFieldWidget(
                    textEditingController: authRegViewModel.regFullNameCtrl,
                    hintText: appLocale.getTranslated('sign_in_name_hint')!,
                    obscureText: false,
                    formIcon: Icons.account_circle_outlined,
                    textInputType: TextInputType.text,
                    validateAction: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: LoginTextFormFieldWidget(
                    textEditingController: authRegViewModel.regEmailCtrl,
                    hintText: appLocale.getTranslated('sign_in_email_hint')!,
                    formIcon: Icons.email_outlined,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validateAction: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return 'Enter E-mail';
                      } else if (!emailValid) {
                        return 'Enter Valid E-mail';
                      }
                      return null;
                    },
                  ),
                ),
                Consumer<RegisterViewModel>(
                  builder: (context, authNotify, child) {
                    return Expanded(
                      flex: 1,
                      child: LoginTextFormFieldWidget(
                        textEditingController: authRegViewModel.regPasswordCtrl,
                        hintText: appLocale.getTranslated('sign_in_pass_hint')!,
                        formIcon: Icons.lock_outline,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: authRegViewModel.passToggle,
                        suffixWidget: InkWell(
                          onTap: () {
                            authNotify.setLogPassToggle();
                          },
                          child: Icon(authRegViewModel.passToggle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        validateAction: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 6) {
                            return 'Password length should be not less than 6 digits, Try Again';
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),
                //// Text form to check the password as same who enter--------
                Consumer<RegisterViewModel>(
                  builder: (context, authNotify, child) {
                    return Expanded(
                      flex: 1,
                      child: LoginTextFormFieldWidget(
                        textEditingController:
                            authRegViewModel.regPasswordConfirmCtrl,
                        hintText: appLocale
                            .getTranslated('sign_in_confirm_pass_hint')!,
                        formIcon: Icons.lock_outline,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: authRegViewModel.passToggle,
                        suffixWidget: InkWell(
                          onTap: () {
                            authNotify.setLogPassToggle();
                          },
                          child: Icon(authRegViewModel.passToggle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        validateAction: (value) {
                          if (value!.isEmpty) {
                            return 'password is Empty';
                          } else if (value.toString() !=
                              authRegViewModel.regPasswordCtrl.text) {
                            return 'Password is not matched';
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),
                Expanded(
                  flex: 0,
                  child: LoginButtonWidget(
                    fixedSize:
                        MaterialStatePropertyAll<Size>(Size.fromHeight(3.h)),
                    buttonColor: AppColor.kMainColor.withOpacity(0.8),
                    onPress: () async {
                      if (authRegViewModel.registerFormFiledKey.currentState!
                          .validate()) {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        //   return VerifyOtpRegister();
                        // }));
                        UsersModel _userModel = UsersModel(
                          name: authRegViewModel.regFullNameCtrl.text,
                          email: authRegViewModel.regEmailCtrl.text,
                          password: authRegViewModel.regPasswordCtrl.text,
                        );
                        await authRegViewModel.registerUser(_userModel);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            dismissDirection: DismissDirection.up,
                            backgroundColor: Colors.red,
                            content: const Text('An error occurred.'),
                            action: SnackBarAction(
                              label: 'Retry',
                              textColor: Colors.white,
                              onPressed: () {
                                // Perform some action
                              },
                            ),
                          ),
                        );
                      }
                      authRegViewModel.regFullNameCtrl.clear();
                      authRegViewModel.regEmailCtrl.clear();
                      authRegViewModel.regPasswordCtrl.clear();
                      authRegViewModel.regPasswordConfirmCtrl.clear();
                    },
                    textButton: appLocale.getTranslated('sign_in_button_text')!,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RegPageTextSection(
                        text: appLocale
                            .getTranslated('sign_in_already_have_account')!,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kGreyColor,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoute.login);
                          authRegViewModel.regFullNameCtrl.clear();
                          authRegViewModel.regEmailCtrl.clear();
                          authRegViewModel.regPasswordCtrl.clear();
                        },
                        child: RegPageTextSection(
                          text: appLocale.getTranslated('sign_in_login')!,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kIconColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
