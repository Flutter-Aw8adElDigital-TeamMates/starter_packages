import 'dart:io';

import 'package:flutter/material.dart';
import 'updater_service.dart';
import 'default_update_widget.dart';
import 'package:store_redirect/store_redirect.dart';

typedef UpdateWidgetBuilder = Widget Function(
    BuildContext context, UpdateType updateType, String latestVersion);

class UpdaterManager {
  late final UpdaterService _updaterService;
  final UpdateWidgetBuilder? _customWidgetBuilder;

  UpdaterManager({UpdateWidgetBuilder? customWidgetBuilder})
      : _customWidgetBuilder = customWidgetBuilder;

  Future<void> initialize() async {
    _updaterService = await UpdaterService.getInstance();
  }

  Future<void> checkForUpdates(BuildContext context) async {
    final currentVersion = await _updaterService.getCurrentVersion();
    final latestVersion = await _updaterService.getLatestVersion();

    if (latestVersion != null) {
      final updateType =
      _updaterService.getUpdateType(currentVersion, latestVersion);

      if (updateType != UpdateType.none) {
        _showUpdateDialog(context, updateType, latestVersion);
      }
    }
  }

  void _showUpdateDialog(
      BuildContext context, UpdateType updateType, String latestVersion) {
    if (_customWidgetBuilder != null) {
      showDialog(
        context: context,
        barrierDismissible: updateType == UpdateType.optional,
        builder: (context) =>
            _customWidgetBuilder!(context, updateType, latestVersion),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: updateType == UpdateType.optional,
        builder: (context) =>
            DefaultUpdateWidget(updateType: updateType, latestVersion: latestVersion),
      );
    }
  }

  static void redirectToStore() {
    if (Platform.isAndroid) {
      StoreRedirect.redirect(androidAppId: UpdaterService.getPackageName() ?? '');
    } else if (Platform.isIOS) {
      StoreRedirect.redirect(iOSAppId: UpdaterService.getAppId()?? '');
    }
  }
}
