import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:e_commerce_app/view_model/app_language_view_model.dart';
import 'package:e_commerce_app/view_model/item_category_view_model.dart';
import 'package:e_commerce_app/view_model/order_item_view_model.dart';
import 'package:e_commerce_app/view_model/register/mail_verification_view_model.dart';
import 'package:e_commerce_app/view_model/register/register_view_model.dart';
import 'package:e_commerce_app/view_model/login_view_model.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/category_view_model.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:e_commerce_app/view_model/item_detail_view_model.dart';
import 'package:e_commerce_app/view_model/onboarding_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:e_commerce_app/view_model/register/reset_password_view_model.dart';
import 'package:e_commerce_app/view_model/search_view_model.dart';
import 'package:e_commerce_app/view_model/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'core/services/connectiviy_service.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/constants/app_routes.dart';
import 'core/utils/routes/routes.dart';
import 'core/utils/show_snackbar.dart';


 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguageViewModel()),
        ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => MailVerificationViewModel()),
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(create: (_) => AuthRegisterViewModelImp()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => OrderItemViewModel()),
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
        ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => ItemCategoryViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => ItemDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => SettingViewModel()),
        StreamProvider<ConnectivityStatus>(
          create: (context) =>
              ConnectivityServices().connectionController.stream,
          initialData: ConnectivityStatus.offline,
        )
      ],
      child: Consumer<AppLanguageViewModel>(builder: (context,notify , child) {
        return Sizer(
            builder:(context , orientation , deviceType){
              return MaterialApp(
                scaffoldMessengerKey: ShowSnackBar.messengerKey,
                navigatorKey: navigatorKey,
                locale: notify.appLocale,
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en' , 'US'),
                  Locale('ar' , 'AR'),
                ],
                localeResolutionCallback: (currentLang , supportLang){
                  if(currentLang != null){
                    for(Locale locale in supportLang){
                      if(locale.languageCode == currentLang.languageCode){
                        return currentLang;
                      }
                    }
                  }else{
                    return supportLang.first;
                  }
                },
                title: 'E-commerce',
                debugShowCheckedModeBanner: false,
                useInheritedMediaQuery: true,
                builder: DevicePreview.appBuilder,
                /// TODO: change all theme of content to v=be suitable with arabic or english theme
                theme: notify.appLocale == const Locale('en','US') ? englishTheme : arabicTheme ,
                //home: const SplashPageSc(),
                //home: const HomepageSc(),
               // home:  CheckLanguageApp(),
               // home:  WrapperPageSc(),
                initialRoute: AppRoute.wrapperPage,
                routes: routes,
              );
            }
        );
      }),
    );
  }
}

