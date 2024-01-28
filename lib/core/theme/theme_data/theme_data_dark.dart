import 'package:flutter/material.dart';

ThemeData getThemeDataDark() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      fontFamily: 'Montserrat',
      primaryColor: Colors.amber,
      appBarTheme: const AppBarTheme(
        color: Colors.greenAccent,
      ),
    );
