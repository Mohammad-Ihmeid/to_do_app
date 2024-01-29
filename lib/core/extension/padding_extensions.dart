import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get sizedHeight => SizedBox(height: toDouble());

  SizedBox get sizedWidth => SizedBox(width: toDouble());
}

///
extension PaddingList on List<Widget> {
  List<Widget> paddingDirectional({
    double top = 0,
    double bottom = 0,
    double start = 0,
    double end = 0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.only(
          top: top,
          bottom: bottom,
          start: start,
          end: end,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingAll(double padding) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.all(padding),
        child: e,
      ),
    ).toList();
  }
}
