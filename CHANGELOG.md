## 1.0.1

- Now using fixed `pointycastle` `Blake2b`:
  - pointycastle: ^3.1.2
  - https://github.com/bcgit/pc-dart/pull/108
  - Removed `argon2_blake2b.dart`, not necessary anymore.

## 1.0.0-no-null-safety

- Same as `v1.0.0` but without Null Safety and using `pointycastle v2.0.1` (also without Null Safety).

## 1.0.0

- Initial version converted from:
  - https://github.com/bcgit/bc-java/blob/master/core/src/main/java/org/bouncycastle/crypto/generators/Argon2BytesGenerator.java
