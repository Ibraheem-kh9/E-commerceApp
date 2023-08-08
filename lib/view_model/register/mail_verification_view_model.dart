import 'dart:async';

import 'package:e_commerce_app/myapp.dart';
import 'package:e_commerce_app/services/auth_services.dart';
import 'package:e_commerce_app/utils/constants/app_routes.dart';
import 'package:e_commerce_app/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/constants/app_routes.dart';

class MailVerificationViewModel with ChangeNotifier {
  final authService = AuthService();
  bool isVerified = false;
  bool canResendLinkVerify = false;
  Timer? timer;


  verifyEmail() {
    isVerified = authService.firebaseAuth.currentUser?.emailVerified ?? false;
    print(isVerified);
    if (!isVerified) {
      sendVerificationMail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }

  }

  Future<void> sendVerificationMail() async {
    try {
      canResendLinkVerify = false;
      Future.delayed(const Duration(seconds: 60),()=>canResendLinkVerify = true);

      await authService.firebaseAuth.currentUser?.sendEmailVerification();
    print('click is posible');
    } catch (e) {
      ShowSnackBar.shSnackBar(e.toString());
    }
    notifyListeners();
  }

  Future checkEmailVerified() async {
    await authService.firebaseAuth.currentUser?.reload();

    isVerified = authService.firebaseAuth.currentUser?.emailVerified ?? false;
    notifyListeners();
    if (isVerified) {
      timer?.cancel();
    //  await navigatorKey.currentState!.pushReplacementNamed(AppRoute.homePage);
     // await authService.firebaseAuth.signOut().then((value) => navigatorKey.currentState!.pushReplacementNamed(AppRoute.login));
    }

  }


}
