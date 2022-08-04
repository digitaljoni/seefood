import 'package:flutter/foundation.dart';

/// Type of Filter
enum FilterType {
  /// Filter by Area
  area,

  /// Filter by category
  category,

  /// Filter by Ingredient
  ingredient,
}

/// Filter Type Extension
extension FilterTypeExtension on FilterType {
  /// name of filter
  String get name => describeEnum(this);

  /// first leter used for
  String get queryField => name[0];
}
