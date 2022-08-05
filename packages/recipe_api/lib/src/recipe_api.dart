import 'package:dio/dio.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_api/src/dtos/recipes_dto.dart';

/// Thrown Exception if categories  fetch has failed
class CategoriesFetchFailure implements Exception {}

/// Thrown Exception if filters  fetch has failed
class FiltersFetchFailure implements Exception {}

/// Thrown Exception if recipes fetch has failed
class RecipesFetchFailure implements Exception {}

/// Thrown Exception if recipe detail fetch has failed
class RecipeDetailFetchFailure implements Exception {}

/// {@template recipe_api}
/// Recipe Api fetchs data from TheMealDB API
/// {@endtemplate}
class RecipeApi {
  /// {@macro recipe_api}
  RecipeApi({
    String? apiKey = '1',
    Dio? dioClient,
  })  : _dioClient = dioClient ?? Dio(),
        _baseUrl = 'https://www.themealdb.com/api/json/v1/$apiKey' {
    _dioClient
      ..options.baseUrl = _baseUrl
      ..options.responseType = ResponseType.json;
  }

  final String _baseUrl;
  final Dio _dioClient;

  /// Fetch [Categories] from API
  Future<Categories> fetchCategories() async {
    final response = await _dioClient.get<dynamic>(
      '/list.php',
      queryParameters: {
        'c': 'list',
      },
    );
    if (response.statusCode != 200) {
      throw CategoriesFetchFailure();
    }
    final dto = RecipesDto.fromJson(response.data as Map<String, dynamic>);
    return Categories.fromDto(dto);
  }

  /// Fetch [Filters] from API
  Future<Filters> fetchFilters(FilterType filterType) async {
    final response = await _dioClient.get<dynamic>(
      '/list.php',
      queryParameters: {
        filterType.queryField: 'list',
      },
    );
    if (response.statusCode != 200) {
      throw CategoriesFetchFailure();
    }
    final dto = RecipesDto.fromJson(response.data as Map<String, dynamic>);
    return Filters.fromDto(dto, filterType);
  }

  /// Fetch [Recipes] from API based on Filter
  Future<Recipes> fetchRecipesByFilter({
    required String query,
    required FilterType filterType,
  }) async {
    final response = await _dioClient.get<dynamic>(
      '/filter.php',
      queryParameters: {
        filterType.queryField: query,
      },
    );
    if (response.statusCode != 200) {
      throw RecipesFetchFailure();
    }
    final dto = RecipesDto.fromJson(response.data as Map<String, dynamic>);
    return Recipes.fromDto(dto);
  }

  /// Fetch [Recipe] from API
  Future<Recipe> fetchRecipeById({required String id}) async {
    final response = await _dioClient.get<dynamic>(
      '/lookup.php',
      queryParameters: {
        'i': id,
      },
    );
    if (response.statusCode != 200) {
      throw RecipeDetailFetchFailure();
    }

    final dto = RecipesDto.fromJson(response.data as Map<String, dynamic>);

    return Recipe.fromDto(dto.first);
  }
}
