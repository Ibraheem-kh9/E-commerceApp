import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:e_commerce_app/repo/connectiviy_service.dart';
import 'package:e_commerce_app/view/homepage_sc.dart';
import 'package:e_commerce_app/view/splash_page_sc.dart';
import 'package:e_commerce_app/view_model/category_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        StreamProvider<ConnectivityStatus>(
          create: (context) =>
              ConnectivityServices().connectionController.stream,
          initialData: ConnectivityStatus.offline,
        )
      ],
      child: MaterialApp(
        title: 'E-commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: /*SplashPageSc(),*/const HomepageSc(),
      ),
    );
  }
}
