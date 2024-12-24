import 'package:flutter/material.dart';

class BaseThemeConfig {
  // Colors
  final ColorScheme lightColorScheme;
  final ColorScheme darkColorScheme;

  // Font families
  final String? arabicFontFamily;
  final String? otherLanguageFontFamily;
  final String? fallbackFontFamily;

  // Text themes
  final TextTheme? arabicTextTheme;
  final TextTheme? otherLanguageTextTheme;
  final TextTheme? fallbackTextTheme;

  const BaseThemeConfig({
    required this.lightColorScheme,
    required this.darkColorScheme,
    this.arabicFontFamily,
    this.otherLanguageFontFamily,
    this.fallbackFontFamily,
    this.arabicTextTheme,
    this.otherLanguageTextTheme,
    this.fallbackTextTheme,
  });
}
