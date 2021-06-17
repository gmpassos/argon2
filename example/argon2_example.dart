import 'dart:typed_data';

import 'package:argon2/argon2.dart';

void main() {
  var password = 'pass123456';
  var salt = 'somesalt'.toBytesLatin1();

  var parameters = Argon2Parameters(
    Argon2Parameters.ARGON2_i,
    salt,
    version: Argon2Parameters.ARGON2_VERSION_10,
    iterations: 2,
    memoryPowerOf2: 16,
  );

  print('Parameters: $parameters');

  var argon2 = Argon2BytesGenerator();

  argon2.init(parameters);

  var passwordBytes = parameters.converter.convert(password);

  print('Generating key from password...');

  var result = Uint8List(32);
  argon2.generateBytes(passwordBytes, result, 0, result.length);

  var resultHex = result.toHexString();

  print('Result: $resultHex');
}
