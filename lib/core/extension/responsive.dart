import 'package:flutter/material.dart';

@immutable
class Responsive {
  final BuildContext context;
  final double deviceHeight;
  final double deviceWidth;

  static Responsive? _instance;

  Responsive._({required this.context})
      : deviceHeight = MediaQuery.sizeOf(context).height,
        deviceWidth = MediaQuery.sizeOf(context).width;

  factory Responsive.getInstance({
    required BuildContext context,
  }) {
    _instance ??= Responsive._(
      context: context,
    );
    return _instance!;
  }

  // general size
  Size get screenSize => MediaQuery.sizeOf(context);
  EdgeInsets get screenPadding => MediaQuery.paddingOf(context);

  // responsive width
  double setWidth({required double width}) {
    if (deviceWidth == 0 || screenSize.height == 0) return 0.0;
    return (deviceWidth * (width / 100));
  }

  // responsive height
  double setHeight({required double height}) {
    if (deviceHeight == 0 || screenSize.height == 0) return 0.0;
    return (deviceHeight * (height / 100));
  }

  // responsive bottom padding
  double setBottomPadding({required double padding}) {
    if (padding == 0) return 0.0;
    return screenPadding.bottom + padding;
  }

  // responsive Left Padding
  double setLeftPadding({required double padding}) {
    if (screenPadding.left != 0 || padding == 0) return 0.0;
    return screenPadding.left + padding;
  }

  // responsive right padding
  double setRightPadding({required double padding}) {
    if (padding == 0) return 0.0;
    return screenPadding.right + padding;
  }

  // responsive top padding
  double setTopPadding({required double padding}) {
    if (screenPadding.top == 0 || padding == 0) return 0.0;
    return screenPadding.top + padding - 20;
  }

  //  set padding from all sides
  double setPadding({required double padding}) {
    final double bottom = screenPadding.bottom;
    final double top = screenPadding.top;
    final double left = screenPadding.left;
    final double right = screenPadding.right;
    if (bottom == 0 || top == 0 || left == 0 || right == 0 || padding == 0) {
      return 0.0;
    }
    return (bottom + top + left + right) + padding;
  }

  // scaling the font size based on scale factor - use for scaling fontSize
  double setFontSize({required double fontSize}) {
    final double sWidth = screenSize.width;
    final double sHeight = screenSize.height;

    final double textScaleFactor =
        MediaQuery.textScalerOf(context).scale(fontSize);

    if (deviceWidth == 0 || deviceHeight == 0 || sWidth == 0 || sHeight == 0) {
      return 0.0;
    }

    return textScaleFactor;
  }

  // double _max(double first, double second) {
  //   return first > second ? first : second;
  // }

  // double _min(double first, double second) {
  //   return first < second ? first : second;
  // }
}

// Extension
extension ExtensionOnWidth on num {
  // Width
  double sW(BuildContext context) => Responsive.getInstance(
        context: context,
      ).setWidth(
        width: toDouble(),
      );
}

extension ExtensionOnHeight on num {
  // Height
  double sH(BuildContext context) => Responsive.getInstance(
        context: context,
      ).setHeight(
        height: toDouble(),
      );
}

// Paddings
extension ExtensionOnPadding on num {
  // All Padding
  double sP(BuildContext context) =>
      Responsive.getInstance(context: context).setPadding(
        padding: toDouble(),
      );
}

extension ExtensionOnLeftPadding on num {
  // Left Padding
  double sLP(BuildContext context) =>
      Responsive.getInstance(context: context).setLeftPadding(
        padding: toDouble(),
      );
}

extension ExtensionOnRightPadding on num {
  // Right padding
  double sRP(BuildContext context) =>
      Responsive.getInstance(context: context).setRightPadding(
        padding: toDouble(),
      );
}

extension ExtensionOnTopPadding on num {
  // Top Padding
  double sTP(BuildContext context) =>
      Responsive.getInstance(context: context).setTopPadding(
        padding: toDouble(),
      );
}

extension ExtensionOnBottomPadding on num {
  // Bottom Padding
  double sBP(BuildContext context) =>
      Responsive.getInstance(context: context).setBottomPadding(
        padding: toDouble(),
      );
}

extension ExtensionOnFontSize on num {
  // Font
  double sF(BuildContext context) =>
      Responsive.getInstance(context: context).setFontSize(
        fontSize: toDouble(),
      );
}
