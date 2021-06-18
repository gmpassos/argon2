import 'dart:typed_data';

import 'package:argon2/src/argon2_extension.dart';
import 'package:argon2/src/argon2_utils.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/digests/blake2b.dart';
import 'package:test/test.dart';

void main() {
  group('IntExtension', () {
    setUp(() {});

    test('tripleShift32', () {
      //positive
      expect(((3185753779 * 3185753779) & 0xFFFFFFFF).tripleShift32(32),
          equals(0));

      expect(25.tripleShift32(25), equals(0));
      expect(13123423.tripleShift32(5), equals(410106));

      //zero
      expect(0.tripleShift32(23), equals(0));

      //negative
      expect((-12245234).tripleShift32(11), equals(2091172));
      expect((-2938648).tripleShift32(4), equals(268251790));
    });

    test('tripleShift64', () {
      //positive
      expect(((3185753779 * 3185753779) & 0xFFFFFFFFFFFFFFFF).tripleShift64(32),
          equals(2363004521));

      expect(25.tripleShift64(25), equals(0));
      expect(13123423.tripleShift64(5), equals(410106));

      //zero
      expect(0.tripleShift64(23), equals(0));

      //negative
      expect((-12245234).tripleShift64(11), equals(9007199254735012));
      expect((-2938648).tripleShift64(4), equals(1152921504606663310));
    });
  });

  group('Longs', () {
    setUp(() {});

    test('rotateRight', () {
      expect(Longs.rotateRight(2, 32), equals(8589934592));
      expect(Longs.rotateRight(8589934594, 24), equals(2199023256064));
      expect(Longs.rotateRight(2207613192706, 16), equals(721138890366386176));
      expect(Longs.rotateRight(721141097979576832, 63),
          equals(1442282195959153664));

      expect(Longs.rotateRight(432913097719682307, 32),
          equals(3472861365385954347));
      expect(Longs.rotateRight(3836265417586443819, 24),
          equals(6558977414970937959));
      expect(Longs.rotateRight(5274078427372293166, 16),
          equals(-8345652583420728045));
      expect(Longs.rotateRight(-6821524402594562105, 63),
          equals(4803695268520427407));
    });
  });

  group('Blake2bDigest', () {
    setUp(() {});

    test('digest 32', () {
      var data = Uint8List.fromList(List.generate(1024, (i) => i));

      var out = Uint8List(32);

      var blake = Blake2bDigest(digestSize: 32);
      print(blake);

      blake.init();
      blake.update(data, 0, data.length);
      blake.update(data, 0, data.length);
      blake.doFinal(out, 0);

      expect(
          HexCodec().encode(out),
          equals(
              '6ed9bf545705dba5971e83a1f2a46a9dd5ac2fe8a934f13cee8d353003eaf908'));
    });
  });
}
