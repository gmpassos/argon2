import 'dart:io';

import 'argon2_platform.dart';

class Argon2PlatformIO extends Argon2Platform {
  static final Argon2PlatformIO instance = Argon2PlatformIO();

  const Argon2PlatformIO();

  @override
  String get platform {
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isLinux) return 'Linux';
    if (Platform.isFuchsia) return 'Fuchsia';
    if (Platform.isMacOS) return 'MacOS';

    return 'native';
  }

  @override
  bool get isNative => true;
}

Argon2Platform getArgon2Platform() => Argon2PlatformIO.instance;
