import 'package:dash_shield/dash_shield.dart';
import 'dash_security_config.dart';

class SecurityChecks {
  Future<void> initialize(DashSecurityConfig config) async {
    await DashShield.initSecurity(config: config.toDashShieldConfig());
  }
}
