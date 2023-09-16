import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_button_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_or_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_text_button_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_textform_field_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/others_ways_login_widget.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce_app/components/app_local.dart';

import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/constants/constant_color.dart';

class LoginSc extends StatelessWidget {
  const LoginSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: authViewModel.loginFormFiledKey,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/images/login_img.png',
                      width: double.infinity,
                      height: 37.h,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.5.h, vertical: 3.5.h),
                      child: Text(
                        AppLocale.of(context).getTranslated('login_title')!,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kMainColor,
                        ),
                      ),
                    ),
                  ),
                  //// Widget of E-Mail Text FormField with style --------------------
                  Expanded(
                    child: LoginTextFormFieldWidget(
                      textEditingController: authViewModel.logEmailCtrl,
                      textInputType: TextInputType.emailAddress,
                      formIcon: Icons.email_outlined,
                      obscureText: false,
                      hintText: AppLocale.of(context)
                          .getTranslated('login_email_hint')!,
                      validateAction: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return 'Enter Email';
                        } else if (!emailValid) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  //// Widget of Password Text FormField with style ------------------
                  Consumer<LoginViewModel>(
                    builder: (context, authNotify, child) {
                      return Expanded(
                        child: LoginTextFormFieldWidget(
                          textEditingController: authViewModel.logPasswordCtrl,
                          hintText: AppLocale.of(context)
                              .getTranslated('login_password_hint')!,
                          formIcon: Icons.lock_outline,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: authViewModel.passToggle,
                          suffixWidget: InkWell(
                            onTap: () {
                              authNotify.setLogPassToggle();
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
                      );
                    },
                  ),

                  //// Widget of Reset password by send link to email-----------
                  Expanded(
                    flex: 1,
                    child: LoginTextButtonWidget(
                      onPress: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoute.forgotPassPage);
                      },
                      text: AppLocale.of(context)
                          .getTranslated('login_forgot_pass')!,
                      color: Colors.grey,
                      size: 10.sp,
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(right: 8.h, left: 8.h, top: 1.h)),
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  //// Widget of Login Button ----------------------------------------
                  Expanded(
                    flex: 0,
                    child: LoginButtonWidget(
                      fixedSize:
                          MaterialStatePropertyAll<Size>(Size(90.w, 6.h)),
                      buttonColor: AppColor.kMainColor.withOpacity(0.8),
                      onPress: () async {
                        if (authViewModel.loginFormFiledKey.currentState!
                            .validate()) {
                          UsersModel userModel = UsersModel(
                            email: authViewModel.logEmailCtrl.text,
                            password: authViewModel.logPasswordCtrl.text,
                          );
                          await authViewModel
                              .signInWithEmailAndPassword(userModel);

                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return WrapperPageSc();
                          //     },
                          //   ),
                          //       (route) => false,
                          // );

                          authViewModel.logEmailCtrl.clear();
                          authViewModel.logPasswordCtrl.clear();
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
                      },
                      textButton: AppLocale.of(context)
                          .getTranslated('login_button_text')!,
                    ),
                  ),

                  // OR Widget -------------------------------------------------
                  const Expanded(flex: 1, child: LoginOrDividerWidget()),

                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OthersWaysLoginWidget(
                          onClickButton: () {
                            ///TODO : Complete Sign In with Google Auth---------
                            authViewModel.signInWithGoogle();
                          },
                          imageSource: 'assets/images/google_icon.png',
                        ),
                        SizedBox(
                          width: 5.w,
                        ),

                        /// TODO: complete login by anonymous user--------------
                        OthersWaysLoginWidget(
                          onClickButton: () {},
                          imageSource: 'assets/images/Anonymous.png',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocale.of(context)
                              .getTranslated('login_not_member')!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 9.sp,
                          ),
                        ),

                        //// Text button of register ---------------------------
                        LoginTextButtonWidget(
                          onPress: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoute.register);
                          },
                          text: AppLocale.of(context)
                              .getTranslated('login_register')!,
                          color: AppColor.kIconColor,
                          size: 11.sp,
                          style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
