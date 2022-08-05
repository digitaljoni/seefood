import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

part 'filter.g.dart';

/// {@template filter}
/// Filter description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Filter {
  /// {@macro filter}
  const Filter({
    required this.name,
    required this.filterType,
  });

  /// Creates a Filter from Json map
  factory Filter.fromJson(Map<String, dynamic> data) => _$FilterFromJson(data);

  /// Helper function that creates a [Filter] from [RecipeDto]
  factory Filter.fromDto(
    RecipeDto recipeDto,
    FilterType filterType,
  ) {
    switch (filterType) {
      case FilterType.area:
        return Filter(name: recipeDto.strArea, filterType: filterType);

      case FilterType.category:
        return Filter(name: recipeDto.strCategory, filterType: filterType);

      case FilterType.ingredient:
        return Filter(name: recipeDto.strIngredient, filterType: filterType);
    }
  }

  /// A description for name
  final String name;

  /// Type of Filter
  final FilterType filterType;

  /// Creates a Json map from a Filter
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
