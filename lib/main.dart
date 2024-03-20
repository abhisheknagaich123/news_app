import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/colors/theme.dart';
import 'package:news_app/res/getx_localization/languages.dart';
import 'package:news_app/res/routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    title: 'News App',
    translations: Languages(),
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    theme: darkTheme,
    themeMode: ThemeMode.system,
    darkTheme: darkTheme,
    getPages: AppRoutes.appRoutes(),
  ));
}
