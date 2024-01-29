import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/app_pages.dart';
import 'package:to_do_app/core/theme/theme_data/theme_data_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: getThemeDataLight(context),
      initialRoute: AppPages.initial,
      routes: AppPages.routes,
    );
  }
}
