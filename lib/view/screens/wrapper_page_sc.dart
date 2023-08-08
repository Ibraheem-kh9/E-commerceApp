import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/utils/constants/app_routes.dart';
import 'package:e_commerce_app/view/screens/auth_screens/register_email_verified_sc.dart';
import 'package:e_commerce_app/view/screens/onboarding_sc.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:e_commerce_app/view_model/register/mail_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/app_language_view_model.dart';
import 'auth_screens/login_page_sc.dart';
import 'auth_screens/register_page_sc.dart';
import 'homepage_sc.dart';

class WrapperPageSc extends StatefulWidget {
  const WrapperPageSc({super.key});

  @override
  State<WrapperPageSc> createState() => _WrapperPageScState();
}

class _WrapperPageScState extends State<WrapperPageSc> {
  AppLanguageViewModel appLanguageViewModel = AppLanguageViewModel();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<LoginViewModel>(context);
    final verifyViewModel = Provider.of<MailVerificationViewModel>(context);
    return Scaffold(
      body: StreamBuilder<UsersModel?>(
        stream: authViewModel.user,
        builder: (_, AsyncSnapshot<UsersModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UsersModel? usersModel = snapshot.data;

            // if(usersModel == null && verifyViewModel.isVerified == false){
            //   return OnBoardingSc();
            // }
            // else if (usersModel != null && verifyViewModel.isVerified == false){
            //   return RegisterEmailVerifiedSc();
            // }
            //
            //   return HomepageSc();

           // return verifyViewModel.isVerified == false ? LoginSc() :  usersModel == null ? const OnBoardingSc() : HomepageSc();
             return usersModel == null  ? OnBoardingSc() : HomepageSc();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
