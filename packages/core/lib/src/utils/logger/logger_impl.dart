import 'package:logger/logger.dart';
import 'app_logger.dart';

class LoggerImpl implements AppLogger {
  // Private static instance
  static final LoggerImpl _instance = LoggerImpl._internal();

  // Private Logger instance from the `logger` package
  final Logger _logger;

  // Private constructor
  LoggerImpl._internal()
      : _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to display
      errorMethodCount: 8, // Number of method calls for errors
      lineLength: 120, // Line length for output
      colors: true, // Enable colors for console output
      printEmojis: true, // Add emojis for log levels
      dateTimeFormat: DateTimeFormat.dateAndTime, // Add timestamp
    ),
  );

  // Public factory constructor to access the singleton instance
  factory LoggerImpl() => _instance;

  @override
  void debug(String message, {String? tag}) {
    _logger.d(_formatMessage(tag, message));
  }

  @override
  void info(String message, {String? tag}) {
    _logger.i(_formatMessage(tag, message));
  }

  @override
  void warning(String message, {String? tag}) {
    _logger.w(_formatMessage(tag, message));
  }

  @override
  void error(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.e(_formatMessage(tag, message), error: error, stackTrace: stackTrace);
  }

  String _formatMessage(String? tag, String message) {
    return tag != null ? '[$tag] $message' : message;
  }
}
