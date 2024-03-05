import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';

class CustomDatePicker {
  Future<DateTime?> showPicker(context, dateTime) async {
    return dateTime = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                textTheme: const TextTheme(),
                colorScheme: const ColorScheme.light(
                    primary: AppColorsLight.primaryColor,
                    onPrimary: AppColorsLight.white,
                    onSurface: Colors.black),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColorsLight.primaryColor))),
            child: child!,
          );
        },
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: dateTime ?? DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2100));
  }
}
