import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_button_widget.dart';
import 'package:e_commerce_app/view/widgets/login_screen_widget/login_textform_field_widget.dart';
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
    final authRegViewModel =
        Provider.of<RegisterViewModel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: authRegViewModel.registerFormFiledKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                    child: Text(
                      'Be A part of our World',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kMainColor,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 5.h,
                  endIndent: 5.h,
                  thickness: 1.5,
                  color: AppColor.kIconColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 4.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kMainColor,
                      ),
                    ),
                  ),
                ),
                LoginTextFormFieldWidget(
                  textEditingController: authRegViewModel.regFullNameCtrl,
                  hintText: 'Full Name',
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
                LoginTextFormFieldWidget(
                  textEditingController: authRegViewModel.regEmailCtrl,
                  hintText: 'E-mail',
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
                Consumer<RegisterViewModel>(
                  builder: (context, authNotify, child) {
                    return LoginTextFormFieldWidget(
                      textEditingController: authRegViewModel.regPasswordCtrl,
                      hintText: 'Password',
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
                    );
                  },
                ),
                //// Text form to check the password as same who enter--------
                Consumer<RegisterViewModel>(
                  builder: (context, authNotify, child) {
                    return LoginTextFormFieldWidget(
                      textEditingController:
                          authRegViewModel.regPasswordConfirmCtrl,
                      hintText: 'Confirm Password',
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
                    );
                  },
                ),
                SizedBox(
                  height: 6.h,
                ),
                LoginButtonWidget(
                  fixedSize: MaterialStatePropertyAll<Size>(Size(90.w, 6.h)),
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
                  textButton: 'Create Account',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have account? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoute.login);
                          authRegViewModel.regFullNameCtrl.clear();
                          authRegViewModel.regEmailCtrl.clear();
                          authRegViewModel.regPasswordCtrl.clear();
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColor.kIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
