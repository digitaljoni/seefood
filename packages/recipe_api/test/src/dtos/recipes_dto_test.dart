import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

import '../sample_data.dart';

void main() {
  final sampleJson = jsonDecode(sampleJsonString) as JsonMap;

  group('RecipesDto', () {
    group('fromJson', () {
      test('works correctly', () {
        final recipesDto = RecipesDto.fromJson(sampleJson);
        expect(
          recipesDto,
          isA<RecipesDto>(),
        );
      });
    });
  });
}
