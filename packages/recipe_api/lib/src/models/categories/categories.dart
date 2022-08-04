import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/recipes_dto.dart';

part 'categories.g.dart';

/// {@template recipes}
/// Categories description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Categories extends Equatable {
  /// {@macro recipes}
  const Categories({
    required this.categories,
  });

  /// Creates a [Categories] from [JsonMap]
  factory Categories.fromJson(JsonMap data) => _$CategoriesFromJson(data);

  /// Creates a [Categories] from [RecipesDto]
  factory Categories.fromDto(RecipesDto recipesDto) {
    return Categories(
      categories: recipesDto.recipes.map(Category.fromDTO).toList(),
    );
  }

  /// A description for recipes
  final List<Category> categories;

  /// Creates a copy of the current Categories with property changes
  Categories copyWith({
    List<Category>? categories,
  }) {
    return Categories(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        categories,
      ];

  /// Creates a [JsonMap] from a [Categories]
  JsonMap toJson() => _$CategoriesToJson(this);
}
