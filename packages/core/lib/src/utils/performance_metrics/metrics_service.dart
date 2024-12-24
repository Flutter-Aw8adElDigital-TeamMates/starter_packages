class MetricsService {
  static final MetricsService _instance = MetricsService._internal();

  MetricsService._internal();

  factory MetricsService() => _instance;

  /// Log API performance metrics
  void logApiMetrics({
    required String method,
    required String url,
    required Duration duration,
    required bool success,
  }) {
    // Add your production monitoring service integration here
    print('API Metrics: $method $url took ${duration.inMilliseconds}ms, Success: $success');
  }

  /// Log general performance metrics
  void logPerformance(String event, Duration duration) {
    print('Performance Event: $event took ${duration.inMilliseconds}ms');
  }

  /// Log custom metrics
  void logCustomMetric(String name, dynamic value) {
    print('Custom Metric: $name = $value');
  }
}
