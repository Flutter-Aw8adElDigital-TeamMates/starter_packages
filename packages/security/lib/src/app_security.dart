import 'package:flutter/material.dart';
import 'security_checks.dart';
import 'screenshot_manager.dart';
import 'ssl_manager.dart';
import 'overlay_manager.dart';
import 'dash_security_config.dart';

class AppSecurity {
  // Singleton instance
  static final AppSecurity _instance = AppSecurity._internal();

  // Private constructor
  AppSecurity._internal();

  // Public factory
  factory AppSecurity() => _instance;

  // State variables
  bool _isSecurityChecksInitialized = false;

  // Modules
  final ScreenshotManager _screenshotManager = ScreenshotManager();
  final SSLManager _sslManager = SSLManager();
  final SecurityChecks _securityChecks = SecurityChecks();

  /// Initialize security checks
  Future<void> initiateSecurityChecks(DashSecurityConfig config) async {
    if (_isSecurityChecksInitialized) {
      throw Exception('Security checks are already initialized.');
    }

    await _securityChecks.initialize(config);
    _isSecurityChecksInitialized = true;
  }

  /// Enable screenshot functionality globally
  Future<void> enableScreenshots() => _screenshotManager.enableScreenshots();

  /// Block screenshot functionality globally
  Future<void> blockScreenshots() => _screenshotManager.blockScreenshots();

  /// Apply SSL Pinning
  Future<void> applySSLPinning(List<String> sslCertificates,dynamic client) =>
      _sslManager.applySSLPinning(sslCertificates,client);

  /// Show overlay when app goes to the background
  Widget applyOverlay({
    required Widget child,
    Widget? overlayWidget,
  }) {
    return OverlayManager.applyOverlay(
      child: child,
      overlayWidget: overlayWidget,
    );
  }
}
