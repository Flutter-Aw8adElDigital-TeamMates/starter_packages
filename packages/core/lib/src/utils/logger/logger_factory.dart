import 'app_logger.dart';
import 'logger_impl.dart';

class LoggerFactory {
  // Return the singleton instance of LoggerImpl
  static final AppLogger _instance = LoggerImpl();

  static AppLogger get logger => _instance;
}
