# argon2

[![pub package](https://img.shields.io/pub/v/argon2.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/argon2)
[![Null Safety](https://img.shields.io/badge/null-safety-brightgreen)](https://dart.dev/null-safety)

[![CI](https://img.shields.io/github/workflow/status/gmpassos/argon2/Dart%20CI/master?logo=github-actions&logoColor=white)](https://github.com/gmpassos/argon2/actions)
[![GitHub Tag](https://img.shields.io/github/v/tag/gmpassos/argon2?logo=git&logoColor=white)](https://github.com/gmpassos/argon2/releases)
[![New Commits](https://img.shields.io/github/commits-since/gmpassos/argon2/latest?logo=git&logoColor=white)](https://github.com/gmpassos/argon2/network)
[![Last Commits](https://img.shields.io/github/last-commit/gmpassos/argon2?logo=git&logoColor=white)](https://github.com/gmpassos/argon2/commits/master)
[![Pull Requests](https://img.shields.io/github/issues-pr/gmpassos/argon2?logo=github&logoColor=white)](https://github.com/gmpassos/argon2/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/gmpassos/argon2?logo=github&logoColor=white)](https://github.com/gmpassos/argon2)
[![License](https://img.shields.io/github/license/gmpassos/argon2?logo=open-source-initiative&logoColor=green)](https://github.com/gmpassos/argon2/blob/master/LICENSE)

Pure Dart Argon2 algorithm (the winner of the Password Hash Competition 2015)
for all Dart platforms (JS/Web, Flutter, VM/Native).

Based on the results of:
- https://password-hashing.net/
- https://www.ietf.org/archive/id/draft-irtf-cfrg-argon2-03.txt

Converted to Dart from:
- https://github.com/bcgit/bc-java/blob/master/core/src/main/java/org/bouncycastle/crypto/generators/Argon2BytesGenerator.java
- License: MIT

## Usage

```dart
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

```

Output:

```text
Parameters: Argon2Parameters{ type: 1, iterations: 2, memory: 65536, lanes: 1, version: 16, converter: UTF8 }
Generating key from password...
Result: 297f7d074e07aaa46316ea006c1440dfe5707746426ec1df6c1d303ab5fd5533
```

## Source

The official source code is [hosted @ GitHub][github_argon2]:

- https://github.com/gmpassos/argon2

[github_argon2]: https://github.com/gmpassos/argon2

# Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

# Contribution

Any help from the open-source community is always welcome and needed:
- Found an issue?
    - Please fill a bug report with details.
- Wish a feature?
    - Open a feature request with use cases.
- Are you using and liking the project?
    - Promote the project: create an article, do a post or make a donation.
- Are you a developer?
    - Fix a bug and send a pull request.
    - Implement a new feature, like other training algorithms and activation functions.
    - Improve the Unit Tests.
- Have you already helped in any way?
    - **Many thanks from me, the contributors and everybody that uses this project!**


[tracker]: https://github.com/gmpassos/argon2/issues

# Author

Graciliano M. Passos: [gmpassos@GitHub][github].

[github]: https://github.com/gmpassos

## License

[Apache License - Version 2.0][apache_license]

[apache_license]: https://www.apache.org/licenses/LICENSE-2.0.txt

*Please, provide a reference to this project and the author for
any derivative work.*
