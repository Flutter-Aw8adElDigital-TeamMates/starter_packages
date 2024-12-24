import 'package:dash_shield/dash_shield.dart';

class ScreenshotManager {
  Future<void> enableScreenshots() async {
    await DashShield.allowScreenshotsGlobally();
  }

  Future<void> blockScreenshots() async {
    await DashShield.preventScreenshotsGlobally();
  }
}
