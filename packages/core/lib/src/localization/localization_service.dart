import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:data/data.dart';

import '../../core.dart';
import '../utils/logger/app_logger.dart';


class LocalizationService {
  final String locale;
  final String translationsPath;
  final bool developerMode;
  final String? remoteTranslationsBaseURL;
  final List<String> supportedLocales;


  late Map<String, String> _localizedStrings = {};
  late Map<String, String> _fallbackStrings = {};
  late final RemoteService? _remoteService;
  late final AppLogger _logger;

  LocalizationService({
    required this.locale,
    required this.translationsPath,
    this.developerMode = false,
    this.remoteTranslationsBaseURL,
    required this.supportedLocales,

  }) {
    _logger = LoggerFactory.logger;
    if (remoteTranslationsBaseURL != null) {
      final dio = Dio(BaseOptions(baseUrl: remoteTranslationsBaseURL!));
      _remoteService = RemoteService(dio);
    } else {
      _remoteService = null;
    }
  }

  Future<void> load() async {
    Map<String, String> combinedTranslations = {};

    try {
      _logger.info('Loading local translations for $locale...');
      final localTranslations = await _loadLocalTranslations(locale);
      combinedTranslations.addAll(localTranslations);
    } catch (e) {
      _logger.error('Error loading local translations for $locale', error: e);
    }

    if (_remoteService != null) {
      try {
        _logger.info('Fetching remote translations for $locale...');
        final remoteTranslations = await _fetchRemoteTranslations('/$locale');
        combinedTranslations.addAll(remoteTranslations);
      } catch (e) {
        _logger.error('Error fetching remote translations for $locale', error: e);
      }
    }

    if (combinedTranslations.isEmpty && locale != 'en') {
      try {
        _logger.warning('No translations found, falling back to English...');
        final fallbackTranslations = await _loadLocalTranslations('en');
        combinedTranslations.addAll(fallbackTranslations);
      } catch (e) {
        _logger.error('Error loading fallback translations for English', error: e);
      }
    }

    _localizedStrings = combinedTranslations;

    if (locale != 'en') {
      _fallbackStrings = await _loadLocalTranslations('en');
    }

    _logger.info('Loaded ${_localizedStrings.length} translations.');
  }

  Future<Map<String, String>> _loadLocalTranslations(String languageCode) async {
    try {
      final jsonString = await rootBundle.loadString('$translationsPath/$languageCode.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      _logger.error('Error reading local translation file for $languageCode', error: e);
      return {};
    }
  }

  Future<Map<String, String>> _fetchRemoteTranslations(String endpoint) async {
    if (_remoteService == null) return {};

    final response = await _remoteService!.get<Map<String, dynamic>>(endpoint);

    return response.when(
      data: (data) {
        return data.map((key, value) => MapEntry(key, value.toString()));
      },
      noConnection: () {
        _logger.warning('No internet connection while fetching remote translations.');
        return {};
      },
      failure: (_, __, ___) {
        _logger.warning('Failed to fetch remote translations.');
        return {};
      },
      noData: () {
        _logger.warning('No data returned from remote translations.');
        return {};
      },
      unexpectedError: (message) {
        _logger.error('Unexpected error: $message');
        return {};
      },
    );
  }

  bool isRTLLocale() => ['ar', 'he', 'fa', 'ur'].contains(locale);

  String translate(String key) {
    if (_localizedStrings.containsKey(key)) {
      return _localizedStrings[key]!;
    } else if (_fallbackStrings.containsKey(key)) {
      return _fallbackStrings[key]!;
    } else {
      if (developerMode) {
        _logger.warning('Missing translation for key: $key');
        return '**$key**';
      }
      return key;
    }
  }

  String translateWithPlural(String key, int count) {
    final pluralKey = '$key.${count == 1 ? 'one' : 'other'}';
    return translate(pluralKey);
  }

  String translateWithArgs(String key, Map<String, String> args) {
    String translation = translate(key);
    args.forEach((placeholder, value) {
      translation = translation.replaceAll('{$placeholder}', value);
    });
    return translation;
  }
}
