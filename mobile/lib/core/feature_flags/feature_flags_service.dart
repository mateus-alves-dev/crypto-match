import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FeatureFlagsService {
  FeatureFlagsService(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  static const _enableEmailLogin = 'enable_email_login';
  static const _enableGoogleLogin = 'enable_google_login';

  Future<void> fetchAndActivate() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 12),
      ),
    );
    await _remoteConfig.setDefaults(const {
      _enableEmailLogin: true,
      _enableGoogleLogin: false,
    });
    await _remoteConfig.fetchAndActivate();
  }

  bool get enableEmailLogin => _remoteConfig.getBool(_enableEmailLogin);

  bool get enableGoogleLogin => _remoteConfig.getBool(_enableGoogleLogin);
}
