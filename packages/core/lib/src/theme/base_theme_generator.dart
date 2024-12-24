import 'package:flutter/material.dart';
import 'base_theme_config.dart';
import 'default_text_theme.dart';

class BaseThemeGenerator {
  static ThemeData generateTheme(BaseThemeConfig config, {bool isDarkMode = false, Locale? locale}) {
    final colorScheme = isDarkMode ? config.darkColorScheme : config.lightColorScheme;
    final fontFamily = _getFontFamily(config, locale);
    final textTheme = _getTextTheme(config, locale);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(fontFamily: fontFamily),
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.bodyLarge,
        ),
      ),
    );
  }

  static String _getFontFamily(BaseThemeConfig config, Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';

    if (isArabic) {
      return config.arabicFontFamily ??
          config.otherLanguageFontFamily ??
          config.fallbackFontFamily ??
          'DefaultArabicFont';
    } else {
      return config.otherLanguageFontFamily ??
          config.arabicFontFamily ??
          config.fallbackFontFamily ??
          'DefaultFont';
    }
  }

  static TextTheme _getTextTheme(BaseThemeConfig config, Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';

    if (isArabic) {
      return config.arabicTextTheme ??
          config.otherLanguageTextTheme ??
          config.fallbackTextTheme ??
          DefaultTextTheme.textTheme;
    } else {
      return config.otherLanguageTextTheme ??
          config.arabicTextTheme ??
          config.fallbackTextTheme ??
          DefaultTextTheme.textTheme;
    }
  }
}
