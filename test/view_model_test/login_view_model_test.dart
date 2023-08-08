import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLogin extends Mock implements LoginViewModel {}

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  group('login test method', () {
    MockLogin mockLogin = MockLogin();
    test('Test Create new User ', () {
      UsersModel usersModel = UsersModel(
        email: 'ibra.it199@gmail.com',
        password: '123456'
      );

      mockLogin.signInWithEmailAndPassword(usersModel);
      expect(usersModel, 'successful');
    });
  });
}
