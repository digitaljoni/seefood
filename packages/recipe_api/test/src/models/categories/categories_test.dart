import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

import '../../sample_data.dart';

void main() {
  final sampleJson = jsonDecode(sampleCategoriesJsonString) as JsonMap;

  group('Recipes', () {
    group('fromJson', () {
      test('works correctly', () {
        final recipesDto = RecipesDto.fromJson(sampleJson);

        final categories = Categories.fromDto(recipesDto);

        expect(
          categories,
          isA<Categories>(),
        );
      });
    });
  });
}
