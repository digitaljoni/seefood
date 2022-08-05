// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      name: json['name'] as String,
      filterType: $enumDecode(_$FilterTypeEnumMap, json['filterType']),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'name': instance.name,
      'filterType': _$FilterTypeEnumMap[instance.filterType]!,
    };

const _$FilterTypeEnumMap = {
  FilterType.area: 'area',
  FilterType.category: 'category',
  FilterType.ingredient: 'ingredient',
};
