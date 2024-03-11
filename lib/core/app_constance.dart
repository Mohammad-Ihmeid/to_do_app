import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_values.dart';

class AppConstance {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      messageWarning(String title, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.s15)),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        content: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  static String formatDate(DateTime date) {
    // Define date format
    DateFormat formatter = DateFormat('dd MMMM yyyy');
    // Format the date
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
