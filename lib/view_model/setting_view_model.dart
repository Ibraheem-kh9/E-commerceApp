import 'package:e_commerce_app/myapp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../core/services/auth_services.dart';
import '../core/utils/constants/app_icons.dart';

class SettingViewModel extends ChangeNotifier {
  final TextEditingController currentPasswordCtrl = TextEditingController();
  final TextEditingController newPasswordCtrl = TextEditingController();
  AuthService authService = AuthService();

  getFirebaseData() {
    authService.firestore
        .collection('users')
        .doc(authService.firebaseAuth.currentUser?.uid)
        .get();
  }

  changePsd() async {
    try {
      AuthCredential cred = EmailAuthProvider.credential(
          email: authService.firebaseAuth.currentUser!.email!,
          password: currentPasswordCtrl.text);
      await authService.firebaseAuth.currentUser!
          .reauthenticateWithCredential(cred)
          .then(
        (value) async {
          await authService.firebaseAuth.currentUser!
              .updatePassword(newPasswordCtrl.text);
        },
      );
      showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) {
            return AlertDialog(
              title: Image.asset(
                AppIcons.successIcon,
                scale: 7.sp,
                width: 5.h,
                height: 5.h,
              ),
              alignment: Alignment.center,
              content: Text(
                'Password updated successfully',
                style: TextStyle(fontSize: 15.sp),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.5.h))),
            );
          });
    } catch (e) {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (_) {
          return AlertDialog(
            title: Image.asset(
              AppIcons.failedIcon,
              scale: 7.sp,
              width: 5.h,
              height: 5.h,
            ),
            alignment: Alignment.center,
            content: Text(
              'password updated failed, try enter correct password',
              style: TextStyle(fontSize: 15.sp),
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2.5.h),
              ),
            ),
          );
        },
      );
    }
  }
}
