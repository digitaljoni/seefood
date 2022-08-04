import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/dtos.dart';

part 'recipes_dto.g.dart';

/// {@template recipes_dto}
/// Recipes Dto - contains list of recipes
/// {@endtemplate}
@immutable
@JsonSerializable()
class RecipesDto {
  /// {@macro recipes_dto}
  const RecipesDto({
    required this.recipes,
  });

  /// Creates a [RecipesDto] from [JsonMap]
  factory RecipesDto.fromJson(JsonMap data) => _$RecipesDtoFromJson(data);

  /// list of recipes
  @JsonKey(name: 'meals', defaultValue: [])
  final List<RecipeDto> recipes;

  /// Creates a [JsonMap] from a [RecipesDto]
  JsonMap toJson() => _$RecipesDtoToJson(this);

  /// Return the first recipe in the list
  RecipeDto get first => recipes.isNotEmpty ? recipes.first : RecipeDto.empty;
}
