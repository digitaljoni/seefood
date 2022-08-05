import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

import '../../sample_data.dart';

void main() {
  final sampleJson = jsonDecode(sampleCategoriesJsonString) as JsonMap;
  const filterType = FilterType.category;

  group('Filter', () {
    group('fromDto', () {
      test('works correctly', () {
        final recipesDto = RecipesDto.fromJson(sampleJson);
        final recipeDto = recipesDto.first;

        final filter = Filter.fromDto(recipeDto, filterType);

        expect(
          filter,
          isA<Filter>().having((f) => f.name, 'name', 'Beef'),
        );
      });
    });
  });
}
