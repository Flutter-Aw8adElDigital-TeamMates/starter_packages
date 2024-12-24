import 'package:flutter/material.dart';
import 'base_theme_generator.dart';
import 'base_theme_config.dart';

class ThemeFactory {
  static ThemeData createTheme(BaseThemeConfig config, BuildContext context, {bool isDarkMode = false,Locale locale = const Locale('en')}) {

    return BaseThemeGenerator.generateTheme(config, isDarkMode: isDarkMode, locale: locale);
  }
}
