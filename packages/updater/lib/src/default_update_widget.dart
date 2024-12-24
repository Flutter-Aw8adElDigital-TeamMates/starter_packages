import 'package:flutter/material.dart';
import 'updater_service.dart';
import 'updater_manager.dart';

class DefaultUpdateWidget extends StatelessWidget {
  final UpdateType updateType;
  final String latestVersion;

  const DefaultUpdateWidget({
    Key? key,
    required this.updateType,
    required this.latestVersion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMandatory =
        updateType == UpdateType.mandatoryBugFix || updateType == UpdateType.mandatoryNewFeatures;

    return AlertDialog(
      title: Text(isMandatory ? 'Mandatory Update' : 'Update Available'),
      content: Text(
        isMandatory
            ? 'A critical update (v$latestVersion) is required to continue using this app.'
            : 'A new version (v$latestVersion) is available. Update now for the latest features.',
      ),
      actions: [
        if (!isMandatory)
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Skip'),
          ),
        TextButton(
          onPressed: () {
            UpdaterManager.redirectToStore();
          },
          child: const Text('Update Now'),
        ),
      ],
    );
  }
}


