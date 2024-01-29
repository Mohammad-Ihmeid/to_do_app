import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColorsLight.white),
      fontFamily: 'Montserrat',
      primaryColor: AppColorsLight.primaryColor,
      scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      textTheme: _textTheme(context),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
            horizontal: VisualDensity.minimumDensity,
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              color: AppColorsLight.textGray50,
            ),
          ),
        ),
      ),
    );

ElevatedButtonThemeData _elevatedButtonThemeData() =>
    const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColorsLight.primaryColor),
      ),
    );

TextTheme _textTheme(BuildContext context) => TextTheme(
      titleLarge: TextStyle(
        fontSize: 16.sF(context),
        color: AppColorsLight.textGray50,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sF(context),
        color: AppColorsLight.white,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sF(context),
        color: AppColorsLight.textGray50,
      ),
    );
