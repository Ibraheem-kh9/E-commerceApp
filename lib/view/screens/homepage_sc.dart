import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/favorite_item_sc.dart';
import 'package:e_commerce_app/view/appbar_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/home_bottom_bar.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/homepage_sc_widget.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'items_categories_sc.dart';
import 'setting_sc.dart';

class HomepageSc extends StatelessWidget {
  HomepageSc({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    ProductViewModel userViewModel = context.watch<ProductViewModel>();
    FavoriteViewModel favoriteViewModel = context.read<FavoriteViewModel>();
    // final GlobalKey<RefreshIndicatorState> _refreshIndicator =
    //     GlobalKey<RefreshIndicatorState>();

    List<Widget> allScreensView = [
      HomepageScWidget(userViewModel: userViewModel,scaffoldMessengerState:favoriteViewModel.scaffoldMessengerKey),
      FavoriteItemSc(),
      ItemsCategoriesSc(),
      SettingSc(),
    ];
    return Scaffold(
      key: favoriteViewModel.scaffoldMessengerKey,
      backgroundColor: kBackgroundColor,
      appBar: userViewModel.currentIndexBar == 0 ||
              userViewModel.currentIndexBar == 1 ||
              userViewModel.currentIndexBar == 2
          ? AppbarWidget(
              userViewModel: userViewModel,
              appbarTitle: 'H-Store',
            )
          : null,
      body: SafeArea(
        child: Consumer<ConnectivityStatus>(
          builder: (context, notify, child) {
            if (notify == ConnectivityStatus.offline) {
              return const Center(
                child:
                    Text('Internet unavailable please check your connection'),
              );
            } else if (notify == ConnectivityStatus.wiFi ||
                notify == ConnectivityStatus.cellular) {
              if (userViewModel.loading == true) {
                return const Center(child: CircularProgressIndicator());
                //return SplashPageSc();
              }

              /// TODO: recoding when no internet and connect should be reload items
              if (userViewModel.userError.code != null) {
                //userViewModel.refreshPage();
                return const Text('Error in loading data');
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                //child: allScreensView.elementAt(userViewModel.currentIndexBar),
                child: PageView(
                  controller: _pageController,
                  children: [
                    allScreensView.elementAt(userViewModel.currentIndexBar),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Error Unknown'));
            }
          },
        ),
      ),
      bottomNavigationBar: HomeBottomBarWidget(
        userViewModel: userViewModel,
      ),
    );
  }
}
