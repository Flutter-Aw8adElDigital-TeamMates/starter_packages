import 'package:flutter/material.dart';

class AppDimensionsConfig {
  // Design size
  final Size designSize;

  // Default paddings and spacings
  final double screenPadding;
  final double buttonHeight;
  final double appBarHeight;
  final double navBarHeight;

  // Font sizes (predefined constants for common usage)
  final double fontSizeSmall;
  final double fontSizeMedium;
  final double fontSizeLarge;
  final double fontSizeExtraLarge;

  // Border radii
  final double cardBorderRadius;
  final double bottomSheetBorderRadius;

  const AppDimensionsConfig({
    this.designSize = const Size(430, 932),
    this.screenPadding = 16.0,
    this.buttonHeight = 50.0,
    this.appBarHeight = 120.0,
    this.navBarHeight = 110.0,
    this.cardBorderRadius = 5.0,
    this.bottomSheetBorderRadius = 20.0,
    this.fontSizeSmall = 12.0,
    this.fontSizeMedium = 16.0,
    this.fontSizeLarge = 24.0,
    this.fontSizeExtraLarge = 30.0,
  });
}
