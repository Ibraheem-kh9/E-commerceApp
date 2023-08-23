import 'package:e_commerce_app/components/app_local.dart';

import 'package:e_commerce_app/view/widgets/more_bar_widgets/setting_account_info_widget.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/setting_card_widget.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/setting_signout_btn_widget.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/app_icons.dart';
import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/constants/constant_color.dart';


class SettingSc extends StatelessWidget {
  const SettingSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<LoginViewModel>(context);
    AppLocale appLocale = AppLocale.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 1.4.h),
          child: ListView(
            children: [
              SettingAccountInfoWidget(
                imageName: AppIcons.accountIcon,
                email:
                    authViewModel.authService.firebaseAuth.currentUser!.email!,
                phoneNumber: 'phone Number',
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.notificationIcon,
                text: appLocale.getTranslated('setting_notification')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.orderIcon,
                text: appLocale.getTranslated('setting_my_order')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.editProfileIcon,
                text: appLocale.getTranslated('setting_edit_profile')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.changePassword);
                },
                imageName: AppIcons.changePasswordIcon,
                text: appLocale.getTranslated('setting_change_password')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.language);
                },
                imageName: AppIcons.languageIcon,
                text: appLocale.getTranslated('setting_language')!,
              ),
              SizedBox(
                height: 1.2.h,
              ),
              ///// every thing about company Contact --------------------------
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.chatUsIcon,
                text: appLocale.getTranslated('setting_chat_with_us')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.helpCenterIcon,
                text: appLocale.getTranslated('setting_help_center')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.privacyCenterIcon,
                text: appLocale.getTranslated('setting_privacy_policy')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.privacyCenterIcon,
                text: appLocale.getTranslated('setting_privacy_policy')!,
              ),
              SettingCardWidget(
                onPress: () {
                  Navigator.pushNamed(context, AppRoute.comingSoon);
                },
                imageName: AppIcons.aboutUsIcon,
                text: appLocale.getTranslated('setting_about_us')!,
              ),
              //// sign out button of account ----------------------------------
              SettingSignOutBtn(
                onPress: () {
                  authViewModel.signOut();
                },
                imageName: AppIcons.logoutIcon,
                text: appLocale.getTranslated('setting_sign_out')!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
