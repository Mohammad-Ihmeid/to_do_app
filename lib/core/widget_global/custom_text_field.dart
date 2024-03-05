import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/utils/app_values.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Color fillColor;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final String hintText;
  final Color hintTextColor;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.fillColor = AppColorsLight.white,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.hintText = '',
    this.hintTextColor = AppColorsLight.white,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textAlign: textAlign,
      onSubmitted: onSubmitted,
      cursorColor: AppColorsLight.white,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: maxLines,
      decoration: InputDecoration(
        //filled: true,
        //fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15.sF(context),
          color: hintTextColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(color: AppColorsLight.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(color: AppColorsLight.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(color: AppColorsLight.white),
        ),
      ),
    );
  }
}
