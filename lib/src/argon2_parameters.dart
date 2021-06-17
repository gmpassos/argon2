import 'dart:convert';
import 'dart:typed_data';

import 'argon2_extension.dart';

/// The Argon2 parameters.
class Argon2Parameters {
  static const int ARGON2_d = 0x00;
  static const int ARGON2_i = 0x01;
  static const int ARGON2_id = 0x02;

  static const int ARGON2_VERSION_10 = 0x10;
  static const int ARGON2_VERSION_13 = 0x13;

  static const int DEFAULT_ITERATIONS = 3;
  static const int DEFAULT_MEMORY_COST = 12;
  static const int DEFAULT_LANES = 1;
  static const int DEFAULT_TYPE = ARGON2_i;
  static const int DEFAULT_VERSION = ARGON2_VERSION_13;

  final int type;

  final Uint8List _salt;
  final Uint8List? _secret;
  final Uint8List? _additional;

  final int iterations;
  final int memory;
  final int lanes;

  final int version;

  final CharToByteConverter converter;

  Argon2Parameters(
    this.type,
    this._salt, {
    Uint8List? secret,
    Uint8List? additional,
    this.iterations = DEFAULT_ITERATIONS,
    int? memoryPowerOf2,
    int? memory,
    this.lanes = DEFAULT_LANES,
    this.version = DEFAULT_VERSION,
    this.converter = CharToByteConverter.UTF8,
  })  : memory = memoryPowerOf2 != null
            ? 1 << memoryPowerOf2
            : (memory ?? (1 << DEFAULT_MEMORY_COST)),
        _secret = secret,
        _additional = additional;

  Uint8List get salt => _salt;

  Uint8List? get secret => _secret;

  Uint8List? get additional => _additional;

  void clear() {
    _salt.clear();
    _secret?.clear();
    _additional?.clear();
  }

  @override
  String toString() {
    return 'Argon2Parameters{ type: $type, iterations: $iterations, memory: $memory, lanes: $lanes, version: $version, converter: ${converter.name} }';
  }
}

abstract class CharToByteConverter {
  static const UTF8 = CharToByteConverterUTF8();
  static const ASCII = CharToByteConverterASCII();

  /// Return the type name of the conversion.
  String get name;

  /// Return a byte encoded representation of the passed in [password].
  /// - [param] password the characters to encode.
  Uint8List convert(String password);
}

class CharToByteConverterUTF8 implements CharToByteConverter {
  const CharToByteConverterUTF8();

  @override
  String get name => 'UTF8';

  @override
  Uint8List convert(String password) => utf8.encode(password).toUint8List();
}

class CharToByteConverterASCII implements CharToByteConverter {
  const CharToByteConverterASCII();

  @override
  String get name => 'ASCII';

  @override
  Uint8List convert(String password) => latin1.encode(password).toUint8List();
}
