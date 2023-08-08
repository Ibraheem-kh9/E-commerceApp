import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:e_commerce_app/utils/constants/constant_color.dart';

import 'package:e_commerce_app/view/appbar_widget.dart';
import 'package:e_commerce_app/view/screens/auth_screens/register_email_verified_sc.dart';
import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/screens/more_bar_screens/setting_sc.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/home_bottom_bar.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/homepage_sc_widget.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../repo/fuctions/exit_app_alert.dart';
import '../../view_model/register/mail_verification_view_model.dart';
import 'favorite_item_sc.dart';
import 'items_categories_sc.dart';
import 'package:lottie/lottie.dart';

class HomepageSc extends StatelessWidget {
  HomepageSc({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ProductViewModel userViewModel = context.watch<ProductViewModel>();
    FavoriteViewModel favoriteViewModel = context.read<FavoriteViewModel>();
    MailVerificationViewModel emailVerifyViewModel = context.read<MailVerificationViewModel>();
    List<Widget> allScreensView = [
      HomepageScWidget(
          userViewModel: userViewModel,
          scaffoldMessengerState: favoriteViewModel.scaffoldMessengerKey),
      FavoriteItemSc(),
      CartSc(),
      ItemsCategoriesSc(),
      SettingSc(),
    ] ;
    Widget defaultValue = allScreensView[0];
    List<Widget> widgetsScreen = List.filled(allScreensView.length, defaultValue);
    return Scaffold(
      key: favoriteViewModel.scaffoldMessengerKey,
      backgroundColor: AppColor.kBackgroundColor,
      appBar: userViewModel.currentIndexBar == 0 ||
              userViewModel.currentIndexBar == 1 ||
              userViewModel.currentIndexBar == 2
          ? AppbarWidget(
              userViewModel: userViewModel,
              appbarTitle: 'H-Store',
            )
          : null,
      body: WillPopScope(
        child: SafeArea(
          child: Consumer<ConnectivityStatus>(
            builder: (context, notify, child) {
              if (notify == ConnectivityStatus.wiFi ||
                  notify == ConnectivityStatus.cellular) {
                if (userViewModel.loading == true) {
                  return Center(
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        AppColor.kMainColor,
                        BlendMode.srcIn,
                      ),
                      child: Lottie.asset(
                        'assets/lottie_files/loading_icon.json',
                        width: 15.h,
                        height: 15.h,
                      ),
                    ),
                  );
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
              } else if (notify == ConnectivityStatus.offline) {
                return const Center(
                  child:
                      Text('Internet unavailable please check your connection'),
                );
              } else {
                return const Center(child: Text('Error Unknown'));
              }
            },
          ),
        ),
        onWillPop: () => exitAppAlert(context),
      ),
      bottomNavigationBar: HomeBottomBarWidget(
        userViewModel: userViewModel,
      ),
    );
  }
}
