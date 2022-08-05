import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

import '../../sample_data.dart';

void main() {
  final sampleJson = jsonDecode(sampleCategoriesJsonString) as JsonMap;
  const filterType = FilterType.category;

  group('Filters', () {
    group('fromDto', () {
      test('works correctly', () {
        final recipesDto = RecipesDto.fromJson(sampleJson);

        final filters = Filters.fromDto(recipesDto, filterType);

        expect(
          filters,
          isA<Filters>(),
        );
      });
    });
  });
}
