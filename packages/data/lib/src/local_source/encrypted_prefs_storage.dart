import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptedPrefsStorage {
  EncryptedPrefsStorage._privateConstructor();
  static final EncryptedPrefsStorage _instance = EncryptedPrefsStorage._privateConstructor();

  static final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static EncryptedPrefsStorage getInstance() => _instance;

  Future<void> save(String key, dynamic value) async {
    String? stringValue;

    if (value is String) {
      stringValue = value;
    } else if (value is int || value is double || value is bool) {
      stringValue = value.toString();
    } else if (value is List<String>) {
      stringValue = value.join(','); // Join list into a comma-separated string
    } else {
      throw UnsupportedError(
          'Unsupported type: ${value.runtimeType}. Only String, int, double, bool, and List<String> are supported.');
    }

    await _secureStorage.write(key: key, value: stringValue);
  }

  Future<dynamic> get(String key) async {
    final stringValue = await _secureStorage.read(key: key);

    if (stringValue == null) return null;

    if (stringValue.contains(',')) {
      return stringValue.split(','); // Handle List<String>
    } else if (int.tryParse(stringValue) != null) {
      return int.parse(stringValue); // Handle int
    } else if (double.tryParse(stringValue) != null) {
      return double.parse(stringValue); // Handle double
    } else if (stringValue == 'true' || stringValue == 'false') {
      return stringValue == 'true'; // Handle bool
    } else {
      return stringValue; // Handle String
    }
  }

  Future<void> remove(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
