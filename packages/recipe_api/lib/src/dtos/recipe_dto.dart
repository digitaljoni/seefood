// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_api/recipe_api.dart';

part 'recipe_dto.g.dart';

/// {@template recipe_dto}
/// Recipe DTO - used to get all the data from API
/// {@endtemplate}
@immutable
@JsonSerializable()
class RecipeDto {
  /// {@macro recipe_dto}
  const RecipeDto({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  /// Creates a [RecipeDto] from a given [JsonMap].
  factory RecipeDto.fromJson(JsonMap data) => _$RecipeDtoFromJson(data);

  @JsonKey(defaultValue: '')
  final String idMeal;
  @JsonKey(defaultValue: '')
  final String strMeal;
  @JsonKey(defaultValue: '')
  final String strDrinkAlternate;
  @JsonKey(defaultValue: '')
  final String strCategory;
  @JsonKey(defaultValue: '')
  final String strArea;
  @JsonKey(defaultValue: '')
  final String strInstructions;
  @JsonKey(defaultValue: '')
  final String strMealThumb;
  @JsonKey(defaultValue: '')
  final String strTags;
  @JsonKey(defaultValue: '')
  final String strYoutube;
  @JsonKey(defaultValue: '')
  final String strIngredient1;
  @JsonKey(defaultValue: '')
  final String strIngredient2;
  @JsonKey(defaultValue: '')
  final String strIngredient3;
  @JsonKey(defaultValue: '')
  final String strIngredient4;
  @JsonKey(defaultValue: '')
  final String strIngredient5;
  @JsonKey(defaultValue: '')
  final String strIngredient6;
  @JsonKey(defaultValue: '')
  final String strIngredient7;
  @JsonKey(defaultValue: '')
  final String strIngredient8;
  @JsonKey(defaultValue: '')
  final String strIngredient9;
  @JsonKey(defaultValue: '')
  final String strIngredient10;
  @JsonKey(defaultValue: '')
  final String strIngredient11;
  @JsonKey(defaultValue: '')
  final String strIngredient12;
  @JsonKey(defaultValue: '')
  final String strIngredient13;
  @JsonKey(defaultValue: '')
  final String strIngredient14;
  @JsonKey(defaultValue: '')
  final String strIngredient15;
  @JsonKey(defaultValue: '')
  final String strIngredient16;
  @JsonKey(defaultValue: '')
  final String strIngredient17;
  @JsonKey(defaultValue: '')
  final String strIngredient18;
  @JsonKey(defaultValue: '')
  final String strIngredient19;
  @JsonKey(defaultValue: '')
  final String strIngredient20;
  @JsonKey(defaultValue: '')
  final String strMeasure1;
  @JsonKey(defaultValue: '')
  final String strMeasure2;
  @JsonKey(defaultValue: '')
  final String strMeasure3;
  @JsonKey(defaultValue: '')
  final String strMeasure4;
  @JsonKey(defaultValue: '')
  final String strMeasure5;
  @JsonKey(defaultValue: '')
  final String strMeasure6;
  @JsonKey(defaultValue: '')
  final String strMeasure7;
  @JsonKey(defaultValue: '')
  final String strMeasure8;
  @JsonKey(defaultValue: '')
  final String strMeasure9;
  @JsonKey(defaultValue: '')
  final String strMeasure10;
  @JsonKey(defaultValue: '')
  final String strMeasure11;
  @JsonKey(defaultValue: '')
  final String strMeasure12;
  @JsonKey(defaultValue: '')
  final String strMeasure13;
  @JsonKey(defaultValue: '')
  final String strMeasure14;
  @JsonKey(defaultValue: '')
  final String strMeasure15;
  @JsonKey(defaultValue: '')
  final String strMeasure16;
  @JsonKey(defaultValue: '')
  final String strMeasure17;
  @JsonKey(defaultValue: '')
  final String strMeasure18;
  @JsonKey(defaultValue: '')
  final String strMeasure19;
  @JsonKey(defaultValue: '')
  final String strMeasure20;
  @JsonKey(defaultValue: '')
  final String strSource;
  @JsonKey(defaultValue: '')
  final String strImageSource;
  @JsonKey(defaultValue: '')
  final String strCreativeCommonsConfirmed;
  @JsonKey(defaultValue: '')
  final String dateModified;

  /// Creates a [JsonMap] from a [RecipeDto]
  JsonMap toJson() => _$RecipeDtoToJson(this);
}
