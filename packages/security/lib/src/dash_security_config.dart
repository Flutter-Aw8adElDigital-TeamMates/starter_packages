import 'package:dash_shield/dash_shield.dart';

class DashSecurityConfig {
  final List<String>? androidSigningHashes;
  final String? androidPackageName;
  final List<String>? iosBundleIds;
  final String? iosTeamId;
  final List<String>? supportedStores;
  final String watcherEmail;
  final bool isProduction;
  final List<SecOnControlsToApply>? checksToEnable;
  final void Function(String)? generalAction;
  final Map<SecOnControlsToApply, void Function(String)>? specificActions;
  final bool enableOnAndroid;
  final bool enableOniOS;


  DashSecurityConfig({
    this.androidSigningHashes,
    this.androidPackageName,
    this.iosBundleIds,
    this.iosTeamId,
    this.supportedStores,
    required this.watcherEmail,
    this.isProduction = true,
    this.checksToEnable,
    this.generalAction,
    this.specificActions,
    required this.enableOnAndroid,
    required this.enableOniOS,

  }) {
    assert(
    enableOnAndroid
        ? androidPackageName != null &&
        androidSigningHashes != null &&
        androidSigningHashes!.isNotEmpty
        : true,
    'Android package name and signing certificate hashes are required when Android checks are enabled.',
    );

    assert(
    enableOniOS
        ? iosTeamId != null &&
        iosBundleIds != null &&
        iosBundleIds!.isNotEmpty
        : true,
    'iOS team ID and bundle IDs are required when iOS checks are enabled.',
    );

    assert(
    enableOnAndroid || enableOniOS,
    'At least one platform (Android or iOS) must be enabled for checks.',
    );

    assert(watcherEmail.isNotEmpty, "Watcher email cannot be empty.");
  }

  SecurityConfig toDashShieldConfig() {
    return SecurityConfig(
      androidSigningSHA256Hashes: androidSigningHashes ?? [],
      androidPackageName: androidPackageName ?? '',
      iosBundleIds: iosBundleIds ?? [],
      iosTeamId: iosTeamId ?? '',
      watcherEmail: watcherEmail,
      checksToEnable: checksToEnable,
      generalAction: generalAction,
      specificActions: specificActions,
      isProduction: isProduction,
      supportedStores: supportedStores ?? [],
      enableOnAndroid: enableOnAndroid,
      enableOniOS: enableOniOS,
    );
  }
}