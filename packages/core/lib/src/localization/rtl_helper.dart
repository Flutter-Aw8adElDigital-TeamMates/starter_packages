import 'package:flutter/material.dart';

class RTLHelper {
  /// Checks if a given locale is RTL
  static bool isRTLLocale(Locale locale) {
    const rtlLanguages = ['ar', 'he', 'fa', 'ur'];
    return rtlLanguages.contains(locale.languageCode);
  }
}
