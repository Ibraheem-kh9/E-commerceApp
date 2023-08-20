import 'package:e_commerce_app/myapp.dart';

import 'package:flutter/material.dart';

import '../../core/services/auth_services.dart';
import '../../core/utils/constants/app_routes.dart';


class ResetPasswordViewModel with ChangeNotifier {
  final AuthService authService = AuthService();
  final TextEditingController resetPasswordEditingCtrl = TextEditingController();

  @override
  void dispose() {
    resetPasswordEditingCtrl.dispose();
    super.dispose();
  }

  Future sendResetPasswordEmail() async {
    try {
      await authService.firebaseAuth
          .sendPasswordResetEmail(email: resetPasswordEditingCtrl.text);
      navigatorKey.currentState!.pushNamed(AppRoute.confirmPassPage);

    } catch (e) {
      print(e);
      showDialog(


        context: navigatorKey.currentContext!,
        builder: (context) {
          return const AlertDialog(
            content: Text("There is no user record found!"),
          );
        },
      );
    }
  }

}
