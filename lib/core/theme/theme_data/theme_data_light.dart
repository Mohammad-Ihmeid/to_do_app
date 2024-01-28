import 'package:flutter/material.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      fontFamily: 'Montserrat',
      primaryColor: Colors.amber,
    );
