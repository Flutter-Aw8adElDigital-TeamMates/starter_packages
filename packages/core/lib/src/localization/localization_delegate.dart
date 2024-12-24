import 'package:flutter/material.dart';
import 'localization_service.dart';

class LocalizationDelegate extends LocalizationsDelegate<LocalizationService> {
  final String translationsPath;
  final bool developerMode;
  final String? remoteTranslationsBaseURL;
  final List<String> supportedLocales;
  final String fallbackLocale;

  LocalizationDelegate({
    required this.translationsPath,
    this.developerMode = false,
    this.remoteTranslationsBaseURL,
    required this.supportedLocales,
    this.fallbackLocale = 'en',
  });

  /// Define supported locales dynamically.
  @override
  bool isSupported(Locale locale) {
    return supportedLocales.contains(locale.languageCode);
  }

  /// Load the appropriate localization service for the selected locale.
  @override
  Future<LocalizationService> load(Locale locale) async {
    final service = LocalizationService(
      locale: locale.languageCode,
      translationsPath: translationsPath,
      developerMode: developerMode,
      remoteTranslationsBaseURL: remoteTranslationsBaseURL,
      supportedLocales: supportedLocales,
    );
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) => false;
}
