// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mem_cache/mem_cache.dart';

void main() {
  group('MemCache', () {
    test('can be instantiated', () {
      expect(MemCache(), isNotNull);
    });

    test('can write and read for a provided key', () {
      final cache = MemCache();
      const key = 'key';
      const value = 123;

      expect(cache.read(key: key), isNull);
      cache.write(key: key, value: value);

      expect(cache.read(key: key), equals(value));
    });
  });
}
