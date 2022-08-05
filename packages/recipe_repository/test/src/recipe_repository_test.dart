// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_repository/recipe_repository.dart';

void main() {
  group('RecipeRepository', () {
    test('can be instantiated', () {
      expect(RecipeRepository(), isNotNull);
    });
  });
}
