import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;
      return await _auth.authenticate(
        localizedReason: 'Please authenticate for using Login',
        biometricOnly: true,
        authMessages: const <AuthMessages>[
          IOSAuthMessages(
            cancelButton: 'Cancel',
          ),
          AndroidAuthMessages(
            cancelButton: 'Cancel',
          ),
        ],
      );
    } on PlatformException catch (e) {
      print('PlatformException error: $e');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
