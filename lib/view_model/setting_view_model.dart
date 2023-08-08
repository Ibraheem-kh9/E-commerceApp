import 'package:e_commerce_app/models/users_model.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class SettingViewModel extends ChangeNotifier{

  AuthService authService = AuthService();
  UsersModel _usersModel = UsersModel();

  UsersModel get usersModel => _usersModel;


  getFirebaseData(){
    authService.firestore.collection('users').doc(authService.firebaseAuth.currentUser?.uid).get();
  }

}