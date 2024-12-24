import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';

enum UpdateType { optional, mandatoryBugFix, mandatoryNewFeatures, none }

class UpdaterService {
  static UpdaterService? _instance;
  late final String appId;
  late final String packageName;
  final AppVersionChecker _versionChecker = AppVersionChecker();

  UpdaterService._();

  static Future<UpdaterService> getInstance() async {
    if (_instance == null) {
      final packageInfo = await PackageInfo.fromPlatform();
      _instance = UpdaterService._()
        ..appId = packageInfo.packageName
        ..packageName = packageInfo.packageName;
    }
    return _instance!;
  }
  static String getPackageName() => _instance?.packageName ?? '';
  static String getAppId() => _instance?.appId ?? '';

  Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String?> getLatestVersion() async {
    try {
      final appInfo = await _versionChecker.checkUpdate();

      return appInfo.newVersion;
    } catch (e) {
      print('Error checking updates: $e');
      return null;
    }
  }

  UpdateType getUpdateType(String currentVersion, String latestVersion) {
    final currentParts = currentVersion.split('.').map(int.parse).toList();
    final latestParts = latestVersion.split('.').map(int.parse).toList();

    if (latestParts[0] > currentParts[0]) {
      return UpdateType.mandatoryNewFeatures;
    } else if (latestParts[1] > currentParts[1]) {
      return UpdateType.mandatoryBugFix;
    } else if (latestParts[2] > currentParts[2]) {
      return UpdateType.optional;
    }
    return UpdateType.none;
  }
}
