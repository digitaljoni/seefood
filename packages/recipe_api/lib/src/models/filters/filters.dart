import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/recipes_dto.dart';

part 'filters.g.dart';

/// {@template recipes}
/// Filters description
/// {@endtemplate}
@immutable
@JsonSerializable()
class Filters extends Equatable {
  /// {@macro recipes}
  const Filters({
    required this.filters,
    required this.filterType,
  });

  /// Creates a [Filters] from [JsonMap]
  factory Filters.fromJson(JsonMap data) => _$FiltersFromJson(data);

  /// Creates a [Filters] from [RecipesDto]
  factory Filters.fromDto(
    RecipesDto recipesDto,
    FilterType filterType,
  ) {
    return Filters(
      filters: recipesDto.recipes
          .map(
            (filter) => Filter.fromDto(
              filter,
              filterType,
            ),
          )
          .toList(),
      filterType: filterType,
    );
  }

  /// A description for recipes
  final List<Filter> filters;

  /// Type of Filter
  final FilterType filterType;

  /// Creates a copy of the current Filters with property changes
  Filters copyWith({
    List<Filter>? filters,
    FilterType? filterType,
  }) {
    return Filters(
      filters: filters ?? this.filters,
      filterType: filterType ?? this.filterType,
    );
  }

  @override
  List<Object?> get props => [
        filters,
      ];

  /// Creates a [JsonMap] from a [Filters]
  JsonMap toJson() => _$FiltersToJson(this);

  /// Creates an empty [Filters]
  static const empty = Filters(
    filters: [],
    filterType: FilterType.area,
  );

  /// return length of Filter list
  int get count => filters.length;
}
