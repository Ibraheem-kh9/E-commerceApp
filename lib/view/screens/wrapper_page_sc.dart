import 'package:e_commerce_app/models/users_model.dart';
import 'package:e_commerce_app/view/homepage_sc.dart';
import 'package:e_commerce_app/view/login_page_sc.dart';
import 'package:e_commerce_app/view_model/authenticate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperPageSc extends StatelessWidget {
  const WrapperPageSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthenticateViewModel>(context);
    return StreamBuilder<UsersModel?>(
      stream: authViewModel.user,
      builder: (_, AsyncSnapshot<UsersModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UsersModel? usersModel = snapshot.data;
          return usersModel == null ? LoginSc() : HomepageSc();
        }
        else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
