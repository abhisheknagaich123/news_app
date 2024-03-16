import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/getx_localization/languages.dart';
import 'package:news_app/res/routes/routes_name.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    translations: Languages(),
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    getPages: AppRoutes.appRoutes(),
  ));
}
