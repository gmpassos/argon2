import 'argon2_platform_generic.dart'
    if (dart.library.io) 'argon2_platform_io.dart'
    if (dart.library.js) 'argon2_platform_js.dart';

abstract class Argon2Platform {
  static Argon2Platform get instance => getArgon2Platform();

  const Argon2Platform();

  String get platform;

  bool get isNative;
}
