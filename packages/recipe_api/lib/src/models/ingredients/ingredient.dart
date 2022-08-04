import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_api/recipe_api.dart';

part 'ingredient.g.dart';

/// {@template ingredient}
/// Ingredient Model, contains name of ingredient, and measurement
/// {@endtemplate}
@immutable
@JsonSerializable()
class Ingredient extends Equatable {
  /// {@macro ingredient}
  const Ingredient({
    required this.name,
    required this.measurement,
  });

  /// Creates an [Ingredient] from [JsonMap].
  factory Ingredient.fromJson(JsonMap json) => _$IngredientFromJson(json);

  /// name of the ingredient
  final String name;

  /// measurement in string format
  final String measurement;

  @override
  List<Object?> get props => [name, measurement];

  /// Converts this [Ingredient] into a [JsonMap].
  JsonMap toJson() => _$IngredientToJson(this);
}
