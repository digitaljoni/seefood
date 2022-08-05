// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      filters: (json['filters'] as List<dynamic>)
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      filterType: $enumDecode(_$FilterTypeEnumMap, json['filterType']),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'filters': instance.filters,
      'filterType': _$FilterTypeEnumMap[instance.filterType]!,
    };

const _$FilterTypeEnumMap = {
  FilterType.area: 'area',
  FilterType.category: 'category',
  FilterType.ingredient: 'ingredient',
};
