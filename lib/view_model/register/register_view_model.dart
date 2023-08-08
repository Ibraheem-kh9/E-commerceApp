import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/users_model.dart';
import '../services/auth_services.dart';

abstract class RegisterViewModel with ChangeNotifier{
  final registerFormFiledKey = GlobalKey<FormState>(debugLabel: 'signUp');
  final TextEditingController regFullNameCtrl = TextEditingController();
  final TextEditingController regEmailCtrl = TextEditingController();
  final TextEditingController regPasswordCtrl = TextEditingController();
  final TextEditingController regPasswordConfirmCtrl = TextEditingController();
   bool _passToggle = true;

  bool get passToggle => _passToggle;
  setLogPassToggle();
  createUserWithEmailAndPassword(UsersModel usersModel);
}

class AuthRegisterViewModelImp extends RegisterViewModel{
  AuthService authService = AuthService();
  FirebaseFirestore userStore = FirebaseFirestore.instance;
  dynamic credential;
  @override
  void dispose(){
    regFullNameCtrl.dispose();
    regEmailCtrl.dispose();
    regPasswordCtrl.dispose();
    regPasswordConfirmCtrl.dispose();
    super.dispose();
  }
  @override
  setLogPassToggle(){
    _passToggle = !_passToggle;
   notifyListeners();
  }
  // UsersModel? _userFromFirebase(auth.User? user){
  //   if(user == null){
  //     return null;
  //   }else{
  //     return UsersModel(id:user.uid,email:user.email);
  //   }
  // }

  @override
  Future<void> createUserWithEmailAndPassword(UsersModel usersModel) async {
    credential = await authService.firebase.createUserWithEmailAndPassword(
      email: usersModel.email!,
      password: usersModel.password!,
    ).then((value) {
      userStore.collection('user-signin').doc(value.user?.uid).set({
        'id' : value.user?.uid,
        'name' : regFullNameCtrl.text,
        'email' : regEmailCtrl.text,
        'password' : regPasswordCtrl.text,
        'confirmPass' : regPasswordConfirmCtrl.text,
      });
    });
  //  return _userFromFirebase(credential.user!)!;
  }
}