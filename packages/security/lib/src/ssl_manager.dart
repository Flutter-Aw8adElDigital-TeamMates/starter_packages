import 'package:dash_shield/dash_shield.dart';

class SSLManager {
  Future<void> applySSLPinning(List<String> sslCertificates,dynamic client) async {
    await DashShield.applySSLPinning(sslCertificates,client);
  }
}
