import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../core/services/auth_services.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../core/utils/show_snackbar.dart';
import '../../models/users_model.dart';
import '../../myapp.dart';


abstract class RegisterViewModel with ChangeNotifier {
  GlobalKey<FormState> registerFormFiledKey =
      GlobalKey<FormState>(debugLabel: 'signUp');
  final TextEditingController regFullNameCtrl = TextEditingController();
  final TextEditingController regEmailCtrl = TextEditingController();
  final TextEditingController regPasswordCtrl = TextEditingController();
  final TextEditingController regPasswordConfirmCtrl = TextEditingController();
  bool _loadData = false;
  bool _passToggle = true;
  bool isVerified = false;
  bool get passToggle => _passToggle;
  bool get loadData => _loadData;
  setLogPassToggle();
  registerUser(UsersModel usersModel);
}

class AuthRegisterViewModelImp extends RegisterViewModel {
  AuthService authService = AuthService();
  FirebaseFirestore userStore = FirebaseFirestore.instance;


  @override
  void dispose() {
    regFullNameCtrl.dispose();
    regEmailCtrl.dispose();
    regPasswordCtrl.dispose();
    regPasswordConfirmCtrl.dispose();
    super.dispose();
  }
  @override
  setLogPassToggle() {
    _passToggle = !_passToggle;
    notifyListeners();
  }

  setLoadData(bool loadData) {
    _loadData = loadData;
    notifyListeners();
  }

  @override
  Future<void> registerUser(UsersModel usersModel) async {

    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (context) => ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppColor.kMainColor,
                BlendMode.srcIn,
              ),
              child: Lottie.asset(
                'assets/lottie_files/loading_icon.json',
                width: 15.h,
                height: 15.h,
              ),
            ));
    try {
      final credential = await authService.firebaseAuth
          .createUserWithEmailAndPassword(
        email: usersModel.email!.trim(),
        password: usersModel.password!.trim(),
      ).then((value) {
        userStore.collection('users').doc(value.user?.uid).set({
          'id': value.user?.uid,
          'name': usersModel.name,
          'email': usersModel.email,
          'createdDate' : DateTime.now(),
        });
        /// value.user?.sendEmailVerification();
         navigatorKey.currentState!.pushReplacementNamed(AppRoute.signInEmailVerified);
      });

    } on auth.FirebaseAuthException catch (e) {
      print(e);
      ShowSnackBar.shSnackBar(e.message);
      navigatorKey.currentState!.pop();
    }
  }
}
