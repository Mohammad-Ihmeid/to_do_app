import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';

class BottomSheetScreen {
  open({
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColorsLight.primaryColor,
      showDragHandle: true,
      constraints: BoxConstraints(
        minHeight: 90.sH(context),
        maxHeight: 90.sH(context),
        minWidth: double.infinity,
      ),
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }
}
