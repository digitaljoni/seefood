import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

part 'category.g.dart';

/// {@template category}
/// Category description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Category {
  /// {@macro category}
  const Category({
    required this.name,
  });

  /// Creates a Category from Json map
  factory Category.fromJson(Map<String, dynamic> data) =>
      _$CategoryFromJson(data);

  /// Helper function that creates a [Category] from [RecipeDto]
  factory Category.fromDTO(RecipeDto recipeDto) {
    return Category(name: recipeDto.strCategory);
  }

  /// A description for name
  final String name;

  /// Creates a Json map from a Category
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
