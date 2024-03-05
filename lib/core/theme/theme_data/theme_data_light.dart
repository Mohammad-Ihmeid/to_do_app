import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/utils/app_values.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColorsLight.white),
      fontFamily: 'Montserrat',
      primaryColor: AppColorsLight.primaryColor,
      scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      textTheme: _textTheme(context),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsLight.primaryDarkColor,
        shape: CircleBorder(),
      ),
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

ElevatedButtonThemeData _elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
        ),
      ),
    );

TextTheme _textTheme(BuildContext context) => TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18.sF(context),
        fontWeight: FontWeight.w600,
        color: AppColorsLight.primaryColor,
        letterSpacing: -1,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sF(context),
        fontWeight: FontWeight.w700,
        color: AppColorsLight.primaryDarkColor,
        letterSpacing: -1,
      ),
      bodySmall: TextStyle(
        fontSize: 15.sF(context),
        fontWeight: FontWeight.w500,
        color: AppColorsLight.primaryColor,
        letterSpacing: -1,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sF(context),
        color: AppColorsLight.textGray50,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sF(context),
        color: AppColorsLight.white,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sF(context),
        color: AppColorsLight.textGray50,
      ),
    );
