import 'package:flutter/material.dart';
import 'localization_service.dart';

class AppLocalization {
  static LocalizationService of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService)!;
  }
}
