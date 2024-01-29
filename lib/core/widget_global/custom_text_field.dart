import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/utils/app_values.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.suffixIcon,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.borderRadius = 0.0,
      this.contentPadding = 0.0,
      this.fillColor = AppColorsLight.white,
      this.validator,
      this.inputFormatters = const []});

  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final double borderRadius;
  final bool obscureText, enabled;
  final Color fillColor;
  final double contentPadding;
  final Widget suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    if (widget.obscureText) {
      obscure = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        if (widget.controller.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length - 1))) {
          setState(() {
            widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length));
          });
        }
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: obscure,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      cursorColor: AppColorsLight.primaryColor,
      style: TextStyle(
        color: AppColorsLight.primaryColor,
        fontSize: 16.sF(context),
        fontWeight: FontWeight.w500,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColorsLight.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () => setState(() => obscure = !obscure),
                child: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? AppColorsLight.primaryColor
                            : AppColorsLight.iconColor),
                    size: 25.sF(context)))
            : const SizedBox(),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColorsLight.textGray.withOpacity(0.5),
          fontSize: 16.sF(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(
            color: AppColorsLight.textGray50,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(
            color: AppColorsLight.textGray50,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          borderSide: const BorderSide(
            color: AppColorsLight.textGray50,
          ),
        ),
      ),
    );
  }
}
