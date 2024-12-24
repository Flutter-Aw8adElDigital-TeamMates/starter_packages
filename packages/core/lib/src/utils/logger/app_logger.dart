abstract class AppLogger {
  void debug(String message, {String? tag});
  void info(String message, {String? tag});
  void warning(String message, {String? tag});
  void error(String message, {String? tag, dynamic error, StackTrace? stackTrace});
}
