
import 'package:e_commerce_app/view_model/authenticate_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage_sc.dart';
import 'login_page_sc.dart';

class CheckGoogleSignSc extends StatelessWidget {
  const CheckGoogleSignSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthenticateViewModel>(context);
    return FutureBuilder(
        future: authVM.gUser!.authentication,
        builder: (context , AsyncSnapshot snap){
          User user = snap.data;
          if(user == null){
            return LoginSc();
          }
          else{
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomepageSc();
            }));
          }
          return Container();
        });
  }
}
