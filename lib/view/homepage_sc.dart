import 'dart:ui';
import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/widgets/appbar_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/homepage_sc_widget.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'items_categories_sc.dart';
import 'setting_sc.dart';

class HomepageSc extends StatelessWidget {
  const HomepageSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    final GlobalKey<RefreshIndicatorState> _refreshIndicator =
        GlobalKey<RefreshIndicatorState>();

    List<Widget> allScreensView = [
      HomepageScWidget(userViewModel: userViewModel),
      ItemsCategoriesSc(/*userViewModel: userViewModel,*/),
      SettingSc(),
    ];
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: userViewModel.currentIndexBar == 0 || userViewModel.currentIndexBar == 1 ? AppbarWidget(userViewModel: userViewModel,) : null,
      body: SafeArea(
        child: Consumer<ConnectivityStatus>(
          builder: (context, notify, child) {
            if (notify == ConnectivityStatus.offline) {
              return const Center(
                child: Text('Internet unavailable please check your connection'),
              );
            } else if (notify == ConnectivityStatus.wiFi ||
                notify == ConnectivityStatus.cellular) {
              if (userViewModel.loading == true) {
                return const Center(child: CircularProgressIndicator());
              }

              /// TODO: recoding when no internet and connect should be reload items
              if (userViewModel.userError.code != null) {
                userViewModel.refreshPage();
                return Text('Error in loading data');
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: allScreensView.elementAt(userViewModel.currentIndexBar),
              );
            } else {
              return const Center(child: Text('Error Unknown'));
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  kMainColor,//const Color.fromRGBO(40, 44, 52, 1),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellowAccent,
          currentIndex: userViewModel.currentIndexBar,
          onTap: (int idx){
          userViewModel.selectedScreenBar(userViewModel.currentIndexBar =idx );
          },
          items: const [
            BottomNavigationBarItem(icon: (Icon(Icons.home)),label: 'Home'),
            BottomNavigationBarItem(icon: (Icon(Icons.category)),label: 'Item Category'),
            BottomNavigationBarItem(icon: (Icon(Icons.settings)),label: 'Setting'),
          ]),
    );
  }
}