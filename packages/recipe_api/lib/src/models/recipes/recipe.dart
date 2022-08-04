import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

part 'recipe.g.dart';

/// {@template recipe}
/// Recipe description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Recipe extends Equatable {
  /// {@macro recipe}
  const Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.area,
    required this.category,
    required this.tags,
    required this.instructions,
    required this.ingredients,
  });

  /// Creates a [Recipe] from [JsonMap]
  factory Recipe.fromJson(JsonMap data) => _$RecipeFromJson(data);

  /// Helper function that creates a [Recipe] from [RecipeDto]
  factory Recipe.fromDTO(RecipeDto recipeDto) {
    final tags = recipeDto.strTags.split(',');
    final instructions = recipeDto.strInstructions.split('\r\n');

    final recipeMap = recipeDto.toJson();

    const ingredientKey = 'strIngredient';
    const measurementKey = 'strMeasure';

    final ingredients = <Ingredient>[];

    for (var i = 0; i < 20; i++) {
      final ingredientName = recipeMap['$ingredientKey$i'] as String? ?? '';

      if (ingredientName != '') {
        final measurement = recipeMap['$measurementKey$i'] as String? ?? '';

        ingredients
            .add(Ingredient(name: ingredientName, measurement: measurement));
      }
    }

    return Recipe(
      id: recipeDto.idMeal,
      name: recipeDto.strMeal,
      imageUrl: recipeDto.strMealThumb,
      category: recipeDto.strCategory,
      area: recipeDto.strArea,
      tags: tags,
      instructions: instructions,
      ingredients: ingredients,
    );
  }

  /// Id of Recipe
  @JsonKey(defaultValue: '')
  final String id;

  /// Name of recipe
  @JsonKey(defaultValue: '')
  final String name;

  /// Full URL of the image
  @JsonKey(defaultValue: '')
  final String imageUrl;

  /// Region where the recipe came from
  @JsonKey(defaultValue: '')
  final String area;

  /// Recipe category
  @JsonKey(defaultValue: '')
  final String category;

  /// Tags of the recipe
  @JsonKey(defaultValue: [])
  final List<String> tags;

  /// List of instructions of the recipe
  @JsonKey(defaultValue: [])
  final List<String> instructions;

  /// A description for ingredients
  @JsonKey(defaultValue: [])
  final List<Ingredient> ingredients;

  /// Creates a copy of the current Recipe with property changes
  Recipe copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? area,
    String? category,
    List<String>? tags,
    List<String>? instructions,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      area: area ?? this.area,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      instructions: instructions ?? this.instructions,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        area,
        category,
        tags,
        instructions,
        ingredients,
      ];

  /// Creates a [JsonMap] from a [Recipe]
  JsonMap toJson() => _$RecipeToJson(this);
}
