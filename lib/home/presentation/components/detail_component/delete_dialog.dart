import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';

class DeleteDialog {
  Future open(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context, true),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppPadding.p16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorderRadius.s12),
                    color: AppColorsLight.white,
                  ),
                  child: Text(
                    "${AppString.delete} ${AppString.toDo.toUpperCase()}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(height: 2.sH(context)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppPadding.p16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorderRadius.s12),
                    color: AppColorsLight.white,
                  ),
                  child: Text(
                    AppString.cancel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
