import 'dart:math';

import 'package:flutter/material.dart';

import 'utils/dimensions/app_dimensions.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
  bool isValidPassword({
    int minLength = 8,
    bool mustContainUppercase = false,
    bool mustContainLowercase = false,
    bool mustContainSpecialChar = false,
    bool mustContainDigit = false,
  }) {
    if (length < minLength) return false; // Check length

    if (mustContainUppercase && !contains(RegExp(r'[A-Z]'))) return false; // Uppercase check

    if (mustContainLowercase && !contains(RegExp(r'[a-z]'))) return false; // Lowercase check

    if (mustContainSpecialChar && !contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
      return false; // Special character check

    if (mustContainDigit && !contains(RegExp(r'[0-9]'))) return false; // Digit check

    return true;
  }

  bool isValidUrl() {
    return Uri.tryParse(this)?.hasAbsolutePath ?? false;
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toTitleCase() {
    return split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  String trimExtraSpaces() {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }
  bool isValidPhoneNumber({
    int minLength = 14,
    int maxLength = 14,
    String? startsWith,
  }) {
    final pattern = RegExp(r'^\+?[0-9]*$'); // Basic numeric or "+<number>" pattern

    if (!pattern.hasMatch(this)) return false; // Must be numeric or include '+'

    if (length < minLength || length > maxLength) return false; // Check length

    if (startsWith != null && !startsWithCharacters(startsWith)) return false; // Check prefix

    return true;
  }

  bool startsWithCharacters(String prefix) {
    return startsWith(prefix);
  }
}

extension EmptyPadding on num {
  SizedBox get paddingHeight => SizedBox(
    height: AppDimensions.h(toDouble()),
  );
  SizedBox get paddingWidth => SizedBox(
    width: AppDimensions.w(toDouble()),
  );
  String formatAsCurrency({int decimalPlaces = 2, String symbol = '\$'}) {
    return '$symbol${toStringAsFixed(decimalPlaces)}';
  }
  double toPrecision(int n) {
    final mod = pow(10.0, n);
    return ((this * mod).round().toDouble() / mod);
  }
}


extension ContextUtils on BuildContext {


  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;

  double get safeAreaTop => MediaQuery.paddingOf(this).top;
  double get safeAreaBottom => MediaQuery.paddingOf(this).bottom;
}