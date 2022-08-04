import 'package:dio/dio.dart';

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
    String? apiKey,
    Dio? dioClient,
  })  : _dioClient = dioClient ?? Dio(),
        _baseUrl = 'https://www.themealdb.com/api/json/v1/$apiKey/' {
    _dioClient
      ..options.baseUrl = _baseUrl
      ..options.responseType = ResponseType.json;
  }

  final String _baseUrl;
  final Dio _dioClient;

  // Future<Recipes> fetchCategories() async {}
}
