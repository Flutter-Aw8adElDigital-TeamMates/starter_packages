import 'package:flutter/material.dart';
import 'rtl_helper.dart';

class LanguageNotifier extends ChangeNotifier {
  Locale _locale;
  late TextDirection _textDirection;

  LanguageNotifier(String initialLanguageCode)
      : _locale = Locale(initialLanguageCode) {
    _textDirection = RTLHelper.isRTLLocale(_locale)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  /// Get the current locale
  Locale get locale => _locale;

  /// Get the current text direction
  TextDirection get textDirection => _textDirection;

  /// Set a new locale and update the text direction
  void setLocale(String languageCode) {
    _locale = Locale(languageCode);
    _textDirection = RTLHelper.isRTLLocale(_locale)
        ? TextDirection.rtl
        : TextDirection.ltr;
    notifyListeners();
  }
}
