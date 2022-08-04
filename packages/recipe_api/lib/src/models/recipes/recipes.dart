import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/recipes_dto.dart';

part 'recipes.g.dart';

/// {@template recipes}
/// Recipes description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Recipes extends Equatable {
  /// {@macro recipes}
  const Recipes({
    required this.recipes,
  });

  /// Creates a [Recipes] from [JsonMap]
  factory Recipes.fromJson(JsonMap data) => _$RecipesFromJson(data);

  /// Creates a [Recipes] from [RecipesDto]
  factory Recipes.fromDto(RecipesDto recipesDto) {
    return Recipes(
      recipes: recipesDto.recipes.map(Recipe.fromDTO).toList(),
    );
  }

  /// A description for recipes
  final List<Recipe> recipes;

  /// Creates a copy of the current Recipes with property changes
  Recipes copyWith({
    List<Recipe>? recipes,
  }) {
    return Recipes(
      recipes: recipes ?? this.recipes,
    );
  }

  @override
  List<Object?> get props => [
        recipes,
      ];

  /// Creates a [JsonMap] from a [Recipes]
  JsonMap toJson() => _$RecipesToJson(this);
}
