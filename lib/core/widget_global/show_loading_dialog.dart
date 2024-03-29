import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {required Key key}) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) => false,
      child: Center(
        child: Card(
          child: Container(
            color: Colors.transparent,
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(
              color: AppColorsLight.white,
            ),
          ),
        ),
      ),
    );
  }
}
