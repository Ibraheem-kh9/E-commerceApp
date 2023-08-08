import 'dart:ui';

import 'package:e_commerce_app/myapp.dart';
import 'package:e_commerce_app/view_model/app_language_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppLanguageViewModel appLanguageViewModel = AppLanguageViewModel();
  await appLanguageViewModel.fetchLocale();
  print(' the app language ${appLanguageViewModel.appLocale}');

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
      //MyApp());
}

