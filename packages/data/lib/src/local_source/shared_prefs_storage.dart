import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  SharedPrefsStorage._privateConstructor();
  static final SharedPrefsStorage _instance = SharedPrefsStorage._privateConstructor();

  static SharedPreferences? _prefs;

  static Future<SharedPrefsStorage> getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _instance;
  }

  static Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      throw UnsupportedError(
          'Unsupported type: ${value.runtimeType}. Only String, int, double, bool, and List<String> are supported.');
    }
  }

  static dynamic get(String key) {
    final value = _prefs!.get(key);
    return value; // Returns the raw value (String, int, double, bool, or List<String>)
  }

  static Future<void> remove(String key) async {
    await _prefs!.remove(key);
  }

  static Future<void> clear() async {
    await _prefs!.clear();
  }
}
