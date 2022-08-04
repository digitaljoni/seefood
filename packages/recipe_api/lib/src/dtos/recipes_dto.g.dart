// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesDto _$RecipesDtoFromJson(Map<String, dynamic> json) => RecipesDto(
      recipes: (json['meals'] as List<dynamic>)
          .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesDtoToJson(RecipesDto instance) =>
    <String, dynamic>{
      'meals': instance.recipes,
    };
